package com.zhuhodor.app.schedule;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.zhuhodor.app.common.constant.RedisConstant;
import com.zhuhodor.app.common.utils.RedisUtil;
import com.zhuhodor.app.service.ICheckLogService;
import com.zhuhodor.app.service.IPostService;
import com.zhuhodor.app.model.pojo.CheckLog;
import com.zhuhodor.app.model.pojo.Post;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

@Configuration
@EnableScheduling
@Slf4j
public class ScheduleTask {
    @Autowired
    private IPostService postService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private ICheckLogService checkLogService;

    //TODO 凌晨00：15持久化前一天评分排名
    @Scheduled(cron = "0 15 0 * * ?")
    private void persistRankData() {
        LocalDate lastDay = LocalDate.now().plusDays(-1);
        String lastDayStr = lastDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String key = RedisConstant.checkRank + lastDayStr;
        //数据库的记录数目
        long totalFromDB = checkLogService.count(new QueryWrapper<CheckLog>().eq("check_time", lastDayStr));
        if (redisUtil.hasKey(key)){
            Set<ZSetOperations.TypedTuple<String>> set = redisUtil.zrangeWithScore(key, 0L, -1L);
            //本期记录总数
            int total = set.size();
            if (total == totalFromDB){
                Iterator<ZSetOperations.TypedTuple<String>> iterator = set.iterator();
                //排名
                int rank = 0;
                ArrayList<CheckLog> saveList = new ArrayList<>();
                while (iterator.hasNext()){
                    rank++;
                    ZSetOperations.TypedTuple<String> entry = iterator.next();
                    String[] split = entry.getValue().split(":");
                    //宿舍Id
                    int dormId = Integer.valueOf(split[0]);
                    //CheckLogId
                    int checkLogId = Integer.valueOf(split[1]);
                    //得分
                    Double score = entry.getScore();
                    CheckLog log = new CheckLog();
                    log.setId(checkLogId);
                    log.setTotal(total);
                    log.setRank(rank);
                    saveList.add(log);
                }
                checkLogService.updateBatchById(saveList);
                return;
            }else {
                log.error("数据库check_rank数据丢失");
            }
        }
        log.error("数据库没有check_rank数据");
        //TODO 从数据库获取数据并计算写入
    }

    /**
     * 每天早上6点执行,定期持久化点赞数量
     * keys的操作会导致数据库暂时被锁住，其他的请求都会被堵塞；业务量大的时候会出问题,所以用Scan替代
     */
    @Scheduled(cron = "0 0 6 * * ?")
    private void persistPostLikes() {
//        Set<String> keys = redisUtil.keys(RedisConstant.postLikePre + '*');
        Set<String> keys = redisUtil.sScan(RedisConstant.postLikePre.getValue() + '*');
        for (String key : keys){
            String[] param = key.split(":");
            int likes = Math.toIntExact(redisUtil.sSize(key));
            postService.update(new UpdateWrapper<Post>().eq("id", param[1]).set("like", likes));
        }
    }
}
