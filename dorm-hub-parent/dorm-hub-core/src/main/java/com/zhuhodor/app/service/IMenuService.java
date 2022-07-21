package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.Menu;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-28
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> getMenusWithRole();

    List<Menu> getMenusByUserId(Integer userId);

    List<Menu> getMenus();

    List<Menu> getMenusByRoleId(Integer roleId);
}
