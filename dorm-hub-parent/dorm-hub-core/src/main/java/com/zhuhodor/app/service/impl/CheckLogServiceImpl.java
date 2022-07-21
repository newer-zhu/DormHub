package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.mapper.CheckLogMapper;
import com.zhuhodor.app.service.ICheckLogService;
import com.zhuhodor.app.mapper.CheckItemLogVoMapper;
import com.zhuhodor.app.model.pojo.CheckLog;
import com.zhuhodor.app.model.vo.CheckItemLogVo;
import com.zhuhodor.app.model.vo.CheckLogAnalysisVo;
import com.zhuhodor.app.model.vo.CheckLogVo;
import com.zhuhodor.app.model.vo.GraphVo;
import com.zhuhodor.app.model.vo.condition.LogSearchVo;
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
    public boolean saveLog(CheckLogVo checkLogVo) {
        CheckLog checkLog = new CheckLog();
        BeanUtils.copyProperties(checkLogVo, checkLog);
        if (checkLogMapper.insert(checkLog) == 1){
            checkLogVo.setId(checkLog.getId());
        }else {
            return false;
        }
        checkLogVo.getItemScores().forEach(i -> {
            i.setCheckLog(checkLog.getId());
        });
        List<CheckItemLogVo> itemScores = checkLogVo.getItemScores();
        return checkItemLogVoMapper.saveCheckItemLogs(itemScores) == itemScores.size() ;
    }

    @Transactional
    @Override
    public CheckLogVo getLogByDormId(Integer id, String time) {
        CheckLogVo checkLogVo = checkLogMapper.getLogByDormId(id, time);
        if (null == checkLogVo){
            return null;
        }
        List<CheckLog> totalLogs = checkLogMapper.selectList(new QueryWrapper<CheckLog>()
                .eq("check_time", time).select("target_dorm").orderByDesc("total_score"));
        int size = totalLogs.size();
        checkLogVo.setTotal(size);
        if (null == checkLogVo.getRank() || 0 >= checkLogVo.getRank()){
            for (int index = 0; index < size; index++){
                if (id == totalLogs.get(index).getTargetDorm()){
                    checkLogVo.setRank(index+1);
                    break;
                }
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
