package com.zhuhodor.app.rabbitmq.producer;


import com.zhuhodor.app.common.constant.RabbitMqConstant;
import com.zhuhodor.app.model.pojo.Post;
import org.springframework.amqp.core.ReturnedMessage;
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

    public void sendMsg(Post msg){
        rabbitTemplate.convertAndSend(RabbitMqConstant.DELAY_EXCHANGE_NAME, RabbitMqConstant.DELAY_QUEUEA_ROUTING_KEY, msg);
    }
}
