package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.EChartsMapper;
import com.zhuhodor.server.model.pojo.CheckLog;
import com.zhuhodor.server.model.vo.CheckLogVo;
import com.zhuhodor.server.model.vo.echarts.LineVo;
import com.zhuhodor.server.model.vo.echarts.PieVo;
import com.zhuhodor.server.service.IEChartsService;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class IEChartsServiceImpl extends ServiceImpl<EChartsMapper, CheckLog> implements IEChartsService {

    @Autowired
    private EChartsMapper eChartsMapper;

    @Transactional
    @Override
    public LineVo getLastTenTimesAvgScores() {
        List<String> xAxis = getLastTimes(7);
        ArrayList<Double> yAxis = new ArrayList<>();
        //y轴
        for (int i = 0; i < xAxis.size(); i++) {
            List<CheckLog> scores = eChartsMapper.selectList(new QueryWrapper<CheckLog>().select("total_score")
                    .eq("check_time", xAxis.get(i)));
            double totalScore = 0;
            for (CheckLog r : scores){
                totalScore += r.getTotalScore();
            }
            yAxis.add(totalScore / scores.size());
        }
        return new LineVo(xAxis, yAxis);
    }

    @Override
    public LineVo getLastTenHighestScores() {
        List<String> xAxis = getLastTimes(7);
        ArrayList<Double> yAxis = new ArrayList<>();
        for(String s : xAxis){
            CheckLog score = eChartsMapper.selectOne(new QueryWrapper<CheckLog>()
                    .select("max(total_score) AS total_score").eq("check_time", s));
            yAxis.add(Double.valueOf(score.getTotalScore()));
        }
        return new LineVo(xAxis, yAxis);
    }

    @Override
    public List<PieVo> getLatestScoreAccount() {
        String time = getLastTimes(1).get(0);
        List<CheckLog> logs = eChartsMapper.selectList(new QueryWrapper<CheckLog>()
                .select("total_score").eq("check_time", time));
        List<PieVo> res = new ArrayList<>();
        res.add(new PieVo( "低于60分", 0));
        res.add(new PieVo( "[60,70)分", 0));
        res.add(new PieVo( "[70,80)分", 0));
        res.add(new PieVo( "[80,90)分", 0));
        res.add(new PieVo( "[90,100]分", 0));
        for (CheckLog log : logs){
            Integer score = log.getTotalScore();
            if (score < 60){
                res.get(0).setValue(res.get(0).getValue()+1);
            }else if (score >= 60 && score < 70){
                res.get(1).setValue(res.get(1).getValue()+1);
            }else if (score >= 70 && score < 80){
                res.get(2).setValue(res.get(2).getValue()+1);
            }else if (score >= 80 && score < 90){
                res.get(3).setValue(res.get(3).getValue()+1);
            }else {
                res.get(4).setValue(res.get(4).getValue()+1);
            }
        }
        return res;
    }

    @Override
    public LineVo getRankedAvgScores() {
        List<CheckLogVo> data = eChartsMapper.getRankedAvgScores(7);
        ArrayList<String> xAxis = new ArrayList<>();
        ArrayList<Double> yAxis = new ArrayList<>();
        for (CheckLogVo log : data){
            xAxis.add(log.getBuildingId()+"-"+log.getDormId());
            yAxis.add(log.getAvgScore());
        }
        return new LineVo(xAxis,yAxis);
    }

    /**
     * 获取近几次的检查时间
     * @return
     */
    List<String> getLastTimes(int number){
        //获取近十期的时间值
        List<String> times = eChartsMapper.getLatestTimes(number);
        ArrayList<String> xAxis = new ArrayList<>();
        //x轴倒序放入
        for (int i = times.size()-1; i >= 0; i--){
            xAxis.add(times.get(i));
        }
        return xAxis;
    }
}
