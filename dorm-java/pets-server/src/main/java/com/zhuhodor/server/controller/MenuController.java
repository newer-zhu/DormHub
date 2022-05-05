package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.Menu;
import com.zhuhodor.server.model.pojo.MenuRole;
import com.zhuhodor.server.service.IMenuRoleService;
import com.zhuhodor.server.service.IMenuService;
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

    @ApiOperation(value = "分配菜单列表给")
    @PostMapping("/allocate/{roleId}")
    @Transactional
    public Result<List<Menu>> allocateMenusToRoleId(@PathVariable("roleId") Integer roleId,
                                                    @RequestBody List<Integer> menuIds){
        menuRoleService.remove(new QueryWrapper<MenuRole>().eq("rid", roleId));
        ArrayList<MenuRole> insert = new ArrayList<>();
        for (int menu : menuIds) {
            insert.add(new MenuRole(menu, roleId));
        }
        menuRoleService.saveBatch(insert);
        return Result.success("更新成功");
    }
}
