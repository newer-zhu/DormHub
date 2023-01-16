package com.zhuhodor.app.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.app.common.constant.RoleNameConstant;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.pojo.Menu;
import com.zhuhodor.app.model.pojo.MenuRole;
import com.zhuhodor.app.service.IMenuRoleService;
import com.zhuhodor.app.service.IMenuService;
import com.zhuhodor.app.service.IRoleService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-28
 */
@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private IMenuService menuService;
    @Autowired
    private IMenuRoleService menuRoleService;
    @Autowired
    private IRoleService roleService;

    @ApiOperation(value = "查询菜单列表")
    @GetMapping()
    public Result getMenus(){
        return Result.success(menuService.getMenus());
    }

    @ApiOperation(value = "通过用户ID查询菜单列表")
    @GetMapping("/list/{userId}")
    public Result<List<Menu>> getMenusByUserId(@PathVariable("userId") Integer userId){
        return Result.success(menuService.getMenusByUserId(userId));
    }

    @ApiOperation(value = "通过roleId查询对应菜单列表")
    @GetMapping("/allocate/{roleId}")
    public Result getMenusByRoleId(@PathVariable("roleId") Integer roleId){
        return Result.success(menuService.getMenusByRoleId(roleId));
    }

    @ApiOperation(value = "分配菜单列表给角色")
    @PostMapping("/allocate/{roleId}")
    public Result<List<Menu>> allocateMenusToRoleId(@PathVariable("roleId") Integer roleId,
                                                    @RequestBody List<Integer> menuIds){
        if (roleService.getById(roleId).getRoleName().equals(RoleNameConstant.Admin)){
            return Result.fail("非root用户不能修改超级管理员菜单！");
        }
        if (roleService.assignMenus(menuIds, roleId)){
            return Result.success("分配成功");
        }else {
            return Result.fail("分配失败！");
        }
    }
}
