package com.zhuhodor.server.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.User;
import com.zhuhodor.server.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-12
 */
@RestController
@RequestMapping("/chat")
public class ChatController {
    @Autowired
    private IUserService userService;

    @GetMapping("/user")
    public Result getAllUsers(Principal principal){
        return Result.success(userService.list(new QueryWrapper<User>()
                .ne("username", principal.getName())
                .select("id", "nick_name", "username", "avatar")));
    }

    @GetMapping("/search/{searchStr}")
    public Result search(@PathVariable("searchStr") String str){
        return Result.success(userService.list(new QueryWrapper<User>()
                .like("nick_name", str).or().like("username", str)
                .select("id", "nick_name", "username", "avatar")));
    }
}
