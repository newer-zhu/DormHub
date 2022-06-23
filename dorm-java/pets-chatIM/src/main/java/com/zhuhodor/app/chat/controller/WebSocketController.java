package com.zhuhodor.app.chat.controller;

import com.zhuhodor.app.chat.config.WebSocketCounter;
import com.zhuhodor.app.model.chat.ChatMsg;
import com.zhuhodor.app.model.pojo.User;
import com.zhuhodor.app.model.security.MyUserDetails;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * websocket控制器
 */
@Slf4j
@RestController
public class WebSocketController {
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    private WebSocketCounter connCounter;

    @MessageMapping("/sendMsg")
    public void handleMsg(Authentication authentication, ChatMsg chatMsg){
        MyUserDetails userDetails = (MyUserDetails)authentication.getPrincipal();
        User user = userDetails.getUser();
        chatMsg.setFrom(user.getUsername());
        chatMsg.setFromNickName(user.getNickName());
//        chatMsg.setDate(LocalDateTime.now());
        /**
         * 点对点发送消息
         * 1.消息接收者
         * 2.消息队列
         * 3.消息对象
         * 消息的类型默认是/user，这个是websocket对单个客户端发送消息特殊的消息类型
         */
        log.info("[{}]发送消息=========={}",user.getNickName(), chatMsg);
        simpMessagingTemplate.convertAndSendToUser(chatMsg.getTo(),"/message/chat",chatMsg);
    }

    /**
     * 用于初始化数据
     * 初次连接返回数据
     * 只执行一次
     **/
    @SubscribeMapping("/welcome")
    public Map<Object, Object> welcome(Authentication authentication) {
        MyUserDetails userDetails = (MyUserDetails) authentication.getPrincipal();
        log.info("用户登入=========>{}", userDetails.getUser().getUsername());
        return connCounter.onlineUserMap();
    }
}
