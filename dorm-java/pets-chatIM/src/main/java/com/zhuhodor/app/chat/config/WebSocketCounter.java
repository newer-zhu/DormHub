package com.zhuhodor.app.chat.config;

import com.zhuhodor.app.common.constant.RedisConstant;
import com.zhuhodor.app.common.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

@Component
public class WebSocketCounter {
    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private SimpMessagingTemplate template;

    private final static String key = RedisConstant.onlineUsers.getValue();

    public synchronized void increment(Integer id) {
        redisUtil.hset(key, String.valueOf(id),
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyy-MM-dd HH:mm:ss")));
        template.convertAndSend("/broadcast/onlineUsers", onlineUserMap());
    }

    public synchronized void decrement(Integer id) {
        redisUtil.hdel(key, String.valueOf(id));
        template.convertAndSend("/broadcast/onlineUsers", onlineUserMap());
    }

    //用户在线人数
    public long onlineUsers() {
        return redisUtil.hlen(key);
    }

    //用户在线Map k:Id v:login_time
    public Map<Object, Object> onlineUserMap() {
        Map<Object, Object> map = redisUtil.hgetall(key);
        //在线人数
        map.put("size", map.size());
        return map;
    }
}
