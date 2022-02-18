package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.CheckItemLogVoMapper;
import com.zhuhodor.server.mapper.CheckLogMapper;
import com.zhuhodor.server.model.pojo.CheckLog;
import com.zhuhodor.server.model.vo.CheckLogAnalysisVo;
import com.zhuhodor.server.model.vo.CheckLogVo;
import com.zhuhodor.server.model.vo.GraphVo;
import com.zhuhodor.server.model.vo.condition.LogSearchVo;
import com.zhuhodor.server.service.ICheckLogService;
import org.springframework.beans.BeanUtils;
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
 * @since 2021-08-20
 */
@Service
public class CheckLogServiceImpl extends ServiceImpl<CheckLogMapper, CheckLog> implements ICheckLogService {
    @Autowired
    private CheckLogMapper checkLogMapper;
    @Autowired
    private CheckItemLogVoMapper checkItemLogVoMapper;

    @Transactional
    @Override
    public void saveLog(CheckLogVo checkLogVo) {
        CheckLog checkLog = new CheckLog();
        BeanUtils.copyProperties(checkLogVo, checkLog);
        checkLogMapper.insert(checkLog);
        checkLogVo.getItemScores().forEach(i -> {
            i.setCheckLog(checkLog.getId());
        });
        checkItemLogVoMapper.saveCheckItemLogs(checkLogVo.getItemScores());
    }

    @Transactional
    @Override
    public CheckLogVo getLogByDormId(Integer id, String time) {
        CheckLogVo checkLogVo = checkLogMapper.getLogByDormId(id, time);
        List<CheckLog> totalLogs = checkLogMapper.selectList(new QueryWrapper<CheckLog>()
                .eq("check_time", time).select("target_dorm"));
        int size = totalLogs.size();
        checkLogVo.setTotal(size);
        for (int index = 0; index < size; index++){
            if (id == totalLogs.get(index).getTargetDorm()){
                checkLogVo.setRank(index+1);
                break;
            }
        }
        return checkLogVo;
    }

    @Override
    @Transactional
    public CheckLogAnalysisVo getAnalysisByDormId(Integer dormId) {
        List<CheckLog> list = checkLogMapper.selectList(new QueryWrapper<CheckLog>()
                .eq("target_dorm", dormId).select("id, total_score, check_time"));
        if (list.size() == 0)
            return null;
        int max = 0, fail = 0, min = Integer.MAX_VALUE;
        float sum = 0;
        ArrayList<GraphVo> graphPoints = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Integer score = list.get(i).getTotalScore();
            max = Math.max(score, max);
            min = Math.min(score, min);
            sum += score;
            if (score < 60) {
                fail++;
            }
            //转换成坐标点,只转换最近7次的数据
            if (i >= list.size() - 7) {
                GraphVo vo = new GraphVo();
                vo.setX(list.get(i).getCheckTime().toString());
                vo.setY(score);
                graphPoints.add(vo);
            }
        }
        CheckLogAnalysisVo analysisVo = new CheckLogAnalysisVo();
        analysisVo.setAverage(sum / list.size());
        analysisVo.setFail(fail);
        analysisVo.setPoints(graphPoints);
        analysisVo.setMaxScore(max);
        analysisVo.setMinScore(min);
        return analysisVo;
    }

    @Override
    public List<CheckLogVo> getLogsByCondition(IPage<CheckLogVo> page, LogSearchVo logSearchVo) {
        return checkLogMapper.getLogsByCondition(page, logSearchVo);
    }
}
