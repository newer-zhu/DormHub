package com.zhuhodor.server.service;

import com.zhuhodor.server.model.pojo.ChecklogRank;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.vo.echarts.LineVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-05
 */
public interface IChecklogRankService extends IService<ChecklogRank> {

    LineVo getLastTenTimesAvgScores();

    LineVo getLastTenHighestScores();
}
