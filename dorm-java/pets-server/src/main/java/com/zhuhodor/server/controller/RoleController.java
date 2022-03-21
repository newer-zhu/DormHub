package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.Role;
import com.zhuhodor.server.service.IRoleService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-17
 */
@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @ApiOperation(value = "获取所有角色")
    @GetMapping()
    public Result getRoles(){
        return Result.success(roleService.list());
    }

    @ApiOperation(value = "新增角色")
    @PostMapping("/admin/add")
    public Result addRole(@RequestBody Role role){
        if (roleService.count(new QueryWrapper<Role>()
                .eq("role_name", role.getRoleName())
                .or().eq("name", role.getName())) > 0){
            return Result.fail("相关角色已存在！");
        }else if(roleService.save(role)){
            return Result.success("添加成功");
        }
        return null;
    }

    @ApiOperation(value = "为角色分配菜单")
    @PostMapping("/admin/assignMenus/{roleId}")
    public Result assignMenus(@RequestBody List<Integer> menuList, @PathVariable("roleId") Integer roleId){
        if (roleService.assignMenus(menuList, roleId)){
            return Result.success("分配成功");
        }else {
            return Result.fail("分配失败！");
        }
    }


}
