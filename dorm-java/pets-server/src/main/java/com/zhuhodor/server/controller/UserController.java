package com.zhuhodor.server.controller;


import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.common.dto.LoginDto;
import com.zhuhodor.server.common.utils.JwtUtil;
import com.zhuhodor.server.common.utils.TencentCos;
import com.zhuhodor.server.model.pojo.User;
import com.zhuhodor.server.security.component.MyUserDetails;
import com.zhuhodor.server.service.IUserService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-07-25
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Autowired
    private IUserService userService;

    @Autowired
    private TencentCos tencentCos;

    @Autowired
    private JwtUtil jwtUtil;

    @ApiOperation(value = "登录以后返回token")
    @PostMapping(value = "/login")
    public Result login(@RequestBody LoginDto loginDto){
        return userService.login(loginDto.getUsername(), loginDto.getPassword());
    }

    @ApiOperation(value = "获取当前用户信息")
    @GetMapping("/info")
    public Result getUserInfo(Principal principal){
        if (null == principal){
            return Result.success("没有此用户信息");
        }
        MyUserDetails userDetails = userService.loadUserByUserName(principal.getName());
        User user = userDetails.getUser();
        user.setPassword(null);
        return Result.success(user);
    }

    @ApiOperation(value = "获取当前用户信息")
    @PostMapping("/info")
    public Result getUserInfo(@RequestBody String token){
        return userService.getUserInfoByToken(token);
    }

//    @ApiOperation(value = "注册用户")
//    @PostMapping(value = "/register")
//    public Result register(@RequestBody User user){
//        return userService.register(user);
//    }


    @ApiOperation(value = "用户头像删除")
    @GetMapping(value = "/avatarDelete")
    public Result uploadAvatar(@RequestParam("key") String key){
        tencentCos.deletePic(key);
        return Result.success(null);
    }

    @ApiOperation(value = "获取所有用户")
    @GetMapping()
    public Result getAllUsers(){
        return Result.success(userService.list());
    }
}
