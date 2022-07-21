package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.pojo.Bed;
import com.zhuhodor.app.model.vo.BedInfo;

import java.util.List;

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

    List<Bed> getBedsByDormIdFromPc(Integer dormId);

    boolean allocateBed(Integer bedId, Integer uid);
}
