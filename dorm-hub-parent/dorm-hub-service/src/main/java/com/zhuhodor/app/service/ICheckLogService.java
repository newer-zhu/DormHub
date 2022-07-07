package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.CheckLog;
import com.zhuhodor.app.model.vo.CheckLogAnalysisVo;
import com.zhuhodor.app.model.vo.CheckLogVo;
import com.zhuhodor.app.model.vo.condition.LogSearchVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-20
 */
public interface ICheckLogService extends IService<CheckLog> {
    boolean saveLog(CheckLogVo checkLogVo);

    CheckLogVo getLogByDormId(Integer id, String time);

    CheckLogAnalysisVo getAnalysisByDormId(Integer dormId);

    List<CheckLogVo> getLogsByCondition(IPage<CheckLogVo> page, LogSearchVo logSearchVo);
}
