package com.zhuhodor.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.pojo.CheckLog;
import com.zhuhodor.server.model.vo.echarts.LineVo;
import com.zhuhodor.server.model.vo.echarts.PieVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-05
 */
public interface IEChartsService extends IService<CheckLog> {

    LineVo getLastTenTimesAvgScores();

    LineVo getLastTenHighestScores();

    List<PieVo> getLatestScoreAccount();

    LineVo getRankedAvgScores();
}
