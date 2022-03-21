package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.RoleMapper;
import com.zhuhodor.server.model.pojo.Role;
import com.zhuhodor.server.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-17
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;


    @Override
    public List<Role> getRolesByUserId(Integer userId) {
        return roleMapper.selectList(new QueryWrapper<Role>().eq("u_id", userId));
    }

    @Transactional
    @Override
    public Boolean assignMenus(List<Integer> menuList, Integer id) {
        roleMapper.releaseMenusByRoleId(id);
        if (menuList.size() != 0){
           return roleMapper.acquireMenusWithRoleId(menuList, id) == menuList.size();
        }
        return false;
    }
}
