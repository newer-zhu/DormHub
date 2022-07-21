package com.zhuhodor.app.controller;


import com.zhuhodor.app.service.IMenuRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2022-04-30
 */
@RestController
@RequestMapping("/server/menu-role")
public class MenuRoleController {
    @Autowired
    private IMenuRoleService menuRoleService;


}
