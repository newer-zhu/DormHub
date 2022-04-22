package com.zhuhodor.server.controller;

import com.zhuhodor.server.common.constant.RedisConstant;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.common.utils.RedisUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/log")
public class LogController {
    @Autowired
    private RedisUtil redisUtil;

    @ApiOperation(value = "获取登录日志")
    @GetMapping("/login")
    public Result loginLogs(){
        String key = RedisConstant.loginLog.getValue();
        List<String> logs = redisUtil.lrange(key, 0, -1);
        return Result.success(logs);
    }
}
