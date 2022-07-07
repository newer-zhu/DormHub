package com.zhuhodor.app.chat.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.app.chat.config.WebSocketCounter;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.pojo.User;
import com.zhuhodor.app.service.IUserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

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

    @Autowired
    private WebSocketCounter webSocketCounter;

    @ApiOperation(value = "获取所有聊天用户")
    @GetMapping("/user")
    public Result getAllUsers(Principal principal){
        List<User> userList = userService.list(new QueryWrapper<User>()
                .select("username", "id", "nick_name", "avatar").ne("nick_name", principal.getName()));
        HashMap<String, Object> map = new HashMap<>();
        map.put("users", userList);
        map.put("onlineUsers", webSocketCounter.onlineUserMap());
        return Result.success(map);
    }

    @GetMapping("/search/{searchStr}")
    @ApiOperation(value = "根据学号或姓名模糊查询")
    public Result search(@PathVariable("searchStr") String str){
        List<User> userList = userService.list(new QueryWrapper<User>()
                .like("nick_name", str).or().like("username", str)
                .select("id", "nick_name", "username", "avatar"));
        HashMap<String, Object> map = new HashMap<>();
        map.put("users", userList);
        map.put("onlineUsers", webSocketCounter.onlineUserMap());
        return Result.success(map);
    }
}
