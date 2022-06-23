package com.zhuhodor.app.chat.listener;

import com.zhuhodor.app.chat.config.WebSocketCounter;
import com.zhuhodor.app.model.security.MyUserDetails;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectEvent;

@Slf4j
@Component
public class WebSocketConnectListener implements ApplicationListener<SessionConnectEvent> {

    @Autowired
    private WebSocketCounter counter;

    @Override
    public void onApplicationEvent(SessionConnectEvent event) {
        UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) event.getUser();
        MyUserDetails userDetails = (MyUserDetails) token.getPrincipal();
        counter.increment(userDetails.getUser().getId());
        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(event.getMessage());
        String sessionId = accessor.getSessionId();
        log.info("sessionId：" + sessionId + "已连接");
    }
}
