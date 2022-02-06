package com.zhuhodor.server.schedule;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.zhuhodor.server.common.constant.RedisConstant;
import com.zhuhodor.server.common.utils.RedisUtil;
import com.zhuhodor.server.model.pojo.Post;
import com.zhuhodor.server.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.Set;

@Configuration
@EnableScheduling
public class ScheduleTask {
    @Autowired
    private IPostService postService;
    @Autowired
    private RedisUtil redisUtil;

    //每天早上7点执行,自动通过审核post
    @Scheduled(cron = "* * 7 * * ?")
    private void passPosts() {
        postService.autoPassAt7Pm();
    }

    /**
     * 每天早上6点执行,定期持久化点赞数量
     * keys的操作会导致数据库暂时被锁住，其他的请求都会被堵塞；业务量大的时候会出问题,所以用Scan替代
     */
    @Scheduled(cron = "* * 6 * * ?")
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
