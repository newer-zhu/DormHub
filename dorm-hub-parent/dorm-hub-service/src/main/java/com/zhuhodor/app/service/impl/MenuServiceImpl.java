package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.mapper.MenuMapper;
import com.zhuhodor.app.model.pojo.Menu;
import com.zhuhodor.app.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-28
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {
    @Autowired
    private MenuMapper menuMapper;

    /**
     * 根据角色查询菜单列表
     * @return
     */
    @Override
    public List<Menu> getMenusWithRole() {
        return menuMapper.getMenusWithRole();
    }

    @Override
    public List<Menu> getMenusByUserId(Integer userId) {
        return menuMapper.getMenusByUserId(userId);
    }

    @Override
    public List<Menu> getMenus() {
        return menuMapper.getMenus();
    }

    @Override
    public List<Menu> getMenusByRoleId(Integer roleId) {
        return menuMapper.getMenusByRoleId(roleId);
    }
}
