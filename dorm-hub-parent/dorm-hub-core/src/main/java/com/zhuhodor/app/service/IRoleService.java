package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.Role;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-17
 */
public interface IRoleService extends IService<Role> {
    List<Role> getRolesByUserId(Integer userId);

    Boolean assignMenus(List<Integer> menuList, Integer roleId);
}
