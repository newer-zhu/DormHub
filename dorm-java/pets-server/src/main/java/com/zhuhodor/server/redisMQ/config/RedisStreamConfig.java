package com.zhuhodor.server.redisMQ.config;


import com.zhuhodor.server.redisMQ.listener.ListenerMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.stream.Consumer;
import org.springframework.data.redis.connection.stream.ReadOffset;
import org.springframework.data.redis.connection.stream.StreamOffset;
import org.springframework.data.redis.stream.StreamMessageListenerContainer;
import org.springframework.data.redis.stream.Subscription;

import java.time.Duration;

/**
 * redis stream 配置（redis5.0以上）
 */
@Configuration
public class RedisStreamConfig {

    @Autowired
    private ListenerMessage listenerMessage;

    @Autowired
    private ListenerMessage listenerMessage2;

    @Bean
    public StreamMessageListenerContainer.StreamMessageListenerContainerOptions<String, ?> streamMessageListenerContainerOptions(){
        return StreamMessageListenerContainer
                .StreamMessageListenerContainerOptions
                .builder()
                .pollTimeout(Duration.ofSeconds(1))
                .build();
    }

    @Bean
    public StreamMessageListenerContainer streamMessageListenerContainer(RedisConnectionFactory factory,
                                                                         StreamMessageListenerContainer.StreamMessageListenerContainerOptions<String, ?> streamMessageListenerContainerOptions){
        StreamMessageListenerContainer listenerContainer = StreamMessageListenerContainer.create(factory,
                streamMessageListenerContainerOptions);
        listenerContainer.start();
        return listenerContainer;
    }

    /**
     * 订阅者1，消费组group1，收到消息后自动确认，与订阅者2为竞争关系，消息仅被其中一个消费
     * @param streamMessageListenerContainer
     * @return
     */
    @Bean
    public Subscription subscription(StreamMessageListenerContainer streamMessageListenerContainer){
        Subscription subscription = streamMessageListenerContainer.receiveAutoAck(
                Consumer.from("group1","name1"),
                StreamOffset.create("stream1", ReadOffset.lastConsumed()),
                listenerMessage
        );
        return subscription;
    }

    /**
     * 订阅者2，消费组group1，收到消息后自动确认，与订阅者1为竞争关系，消息仅被其中一个消费
     * @param streamMessageListenerContainer
     * @return
     */
    @Bean
    public Subscription subscription2(StreamMessageListenerContainer streamMessageListenerContainer){
        Subscription subscription = streamMessageListenerContainer.receiveAutoAck(
                Consumer.from("group1","name2"),
                StreamOffset.create("stream1", ReadOffset.lastConsumed()),
                listenerMessage
        );
        return subscription;
    }

    /**
     * 订阅者3，消费组group2，收到消息后不自动确认，需要用户选择合适的时机确认，与订阅者1和2非竞争关系，即使消息被订阅者1或2消费，亦可消费
     *
     * 当某个消息被ACK，PEL列表就会减少
     * 如果服务器发生意外，重启连接后将再次收到PEL中的消息ID列表
     * @param streamMessageListenerContainer
     * @return
     */
    @Bean
    public Subscription subscription3(StreamMessageListenerContainer streamMessageListenerContainer){
        Subscription subscription = streamMessageListenerContainer.receive(
                Consumer.from("group2","name1"),
                StreamOffset.create("stream1", ReadOffset.lastConsumed()),
                listenerMessage2
        );
        return subscription;
    }

}
