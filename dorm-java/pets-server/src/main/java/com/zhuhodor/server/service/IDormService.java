package com.zhuhodor.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.pojo.Dorm;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-12
 */
public interface IDormService extends IService<Dorm> {
    Dorm getDormById(Integer id);

    List<Dorm> getDormWithStuByBuildingId(String building, int floor);
}
