package com.zhuhodor.server.rabbitMq.producer;

import com.zhuhodor.server.rabbitMq.config.RabbitMqConstant;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 业务延迟信息产生者
 */
@Component
public class DelayMessageProducer {
    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendMsg(String msg){
        rabbitTemplate.convertAndSend(RabbitMqConstant.DELAY_EXCHANGE_NAME, RabbitMqConstant.DELAY_QUEUEA_ROUTING_KEY, msg);
    }
}
