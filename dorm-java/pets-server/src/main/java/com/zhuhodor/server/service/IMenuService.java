package com.zhuhodor.server.service;

import com.zhuhodor.server.model.pojo.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

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
