package com.zhuhodor.server.chat.controller;

import com.zhuhodor.server.chat.ChatMsg;
import com.zhuhodor.server.model.pojo.User;
import com.zhuhodor.server.security.component.MyUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;

/**
 * websocket控制器
 */
@Controller
public class WebSocketController {
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @MessageMapping("/sendMessages")
    public void handleMsg(Authentication authentication, ChatMsg chatMsg){
        MyUserDetails userDetails = (MyUserDetails)authentication.getPrincipal();
        User user = userDetails.getUser();
        chatMsg.setFrom(user.getUsername());
        chatMsg.setFromNickName(user.getNickName());
        /**
         * 点对点发送消息
         * 1.消息接收者
         * 2.消息队列
         * 3.消息对象
         * 消息的类型默认是/user，这个是websocket对单个客户端发送消息特殊的消息类型
         */
        simpMessagingTemplate.convertAndSendToUser(chatMsg.getTo(),"/message/chat",chatMsg);
    }
}
