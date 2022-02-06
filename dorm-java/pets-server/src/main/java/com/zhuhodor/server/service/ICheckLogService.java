package com.zhuhodor.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.pojo.CheckLog;
import com.zhuhodor.server.model.vo.CheckLogAnalysisVo;
import com.zhuhodor.server.model.vo.CheckLogVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-20
 */
public interface ICheckLogService extends IService<CheckLog> {
    void saveLog(CheckLogVo checkLogVo);

    CheckLogVo getLogByDormId(Integer id, String time);

    CheckLogAnalysisVo getAnalysisByDormId(Integer dormId);
}
