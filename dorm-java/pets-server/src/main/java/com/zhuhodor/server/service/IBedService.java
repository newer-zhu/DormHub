package com.zhuhodor.server.service;

import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.Bed;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.vo.BedInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-12
 */
public interface IBedService extends IService<Bed> {
    //预约床位
    Result reserve(Integer userId, Integer bedId);

    BedInfo getBedInfoByUserId(Integer userId);

    boolean cancel(Integer userId, Integer bedId);
}
