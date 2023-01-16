package com.zhuhodor.app.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.pojo.Role;
import com.zhuhodor.app.service.IRoleService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
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


}
