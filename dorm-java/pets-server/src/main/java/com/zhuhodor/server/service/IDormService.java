package com.zhuhodor.server.service;

import com.zhuhodor.server.model.pojo.Dorm;
import com.baomidou.mybatisplus.extension.service.IService;

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
}
