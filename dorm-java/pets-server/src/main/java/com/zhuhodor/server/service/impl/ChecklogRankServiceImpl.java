package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.ChecklogRankMapper;
import com.zhuhodor.server.model.pojo.ChecklogRank;
import com.zhuhodor.server.model.vo.echarts.LineVo;
import com.zhuhodor.server.service.IChecklogRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-05
 */
@Service
public class ChecklogRankServiceImpl extends ServiceImpl<ChecklogRankMapper, ChecklogRank> implements IChecklogRankService {

    @Autowired
    private ChecklogRankMapper rankMapper;

    @Transactional
    @Override
    public LineVo getLastTenTimesAvgScores() {
        List<String> xAxis = getLastTenTimes(7);
        ArrayList<Double> yAxis = new ArrayList<>();
        //y轴
        for (int i = 0; i < xAxis.size(); i++) {
            List<ChecklogRank> scores = rankMapper.selectList(new QueryWrapper<ChecklogRank>().select("score")
                    .eq("check_date", xAxis.get(i)));
            double totalScore = 0;
            for (ChecklogRank r : scores){
                totalScore += r.getScore();
            }
            yAxis.add(totalScore / scores.size());
        }
        return new LineVo(xAxis, yAxis);
    }

    @Override
    public LineVo getLastTenHighestScores() {
        List<String> xAxis = getLastTenTimes(7);
        ArrayList<Double> yAxis = new ArrayList<>();
        for(String s : xAxis){
            ChecklogRank score = rankMapper.selectOne(new QueryWrapper<ChecklogRank>().select("max(score) AS score").eq("check_date", s));
            yAxis.add(score.getScore());
        }
        return new LineVo(xAxis, yAxis);
    }

    /**
     * 获取近几次的检查时间
     * @return
     */
    List<String> getLastTenTimes(int number){
        //获取近十期的时间值
        List<String> times = rankMapper.getLatestTimes(number);
        ArrayList<String> xAxis = new ArrayList<>();
        //x轴倒序放入
        for (int i = times.size()-1; i >= 0; i--){
            xAxis.add(times.get(i));
        }
        return xAxis;
    }
}
