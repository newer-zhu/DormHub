package com.zhuhodor.server.redisMQ.listener;

import org.springframework.data.redis.connection.stream.MapRecord;
import org.springframework.data.redis.stream.StreamListener;
import org.springframework.stereotype.Component;

/**
 * redis stream监听消息
 */
@Component
public class ListenerMessage implements StreamListener<String, MapRecord<String, String, String>> {

    @Override
    public void onMessage(MapRecord<String, String, String> message) {
        // 接收到消息
        System.out.println("message id " + message.getId());
        System.out.println("stream " + message.getStream());
        System.out.println("body " + message.getValue());
    }

}
