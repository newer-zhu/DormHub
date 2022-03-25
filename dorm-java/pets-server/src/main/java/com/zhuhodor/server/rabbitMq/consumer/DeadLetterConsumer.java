package com.zhuhodor.server.rabbitMq.consumer;

import com.rabbitmq.client.Channel;
import com.zhuhodor.server.rabbitMq.config.RabbitMqConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Date;

/**
 * 死信队列消费者
 */
@Component
@Slf4j
public class DeadLetterConsumer {

    @RabbitListener(queues = RabbitMqConstant.DEAD_LETTER_QUEUEA_NAME)
    public void receiveA(Message message, Channel channel) throws IOException {
        String msg = new String(message.getBody());
        log.info("当前时间：{},死信队列A收到消息：{}", new Date().toString(), msg);
        channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
    }

//    @RabbitListener(queues = RabbitMqConstant.DEAD_LETTER_QUEUEB_NAME)
//    public void receiveB(Message message, Channel channel) throws IOException {
//        String msg = new String(message.getBody());
//        log.info("当前时间：{},死信队列B收到消息：{}", new Date().toString(), msg);
//        channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
//    }
}
