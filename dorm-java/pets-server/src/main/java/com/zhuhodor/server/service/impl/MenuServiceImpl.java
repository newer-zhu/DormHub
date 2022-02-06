package com.zhuhodor.server.service.impl;

import com.zhuhodor.server.model.pojo.Menu;
import com.zhuhodor.server.mapper.MenuMapper;
import com.zhuhodor.server.service.IMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
}
