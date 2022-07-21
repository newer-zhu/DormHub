package com.zhuhodor.app.rabbitmq.producer;

import com.zhuhodor.app.common.constant.RabbitMqConstant;
import com.zhuhodor.app.model.dto.MqTransferDTO;
import com.zhuhodor.app.model.pojo.Bed;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author: Hodor_Zhu
 * @description 预约床位信息生产者
 * @date: 2022/7/20 18:01
 */
@Component
public class PreserveBedProducer {
    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendMsg(MqTransferDTO<Bed> msg){
        rabbitTemplate.convertAndSend(RabbitMqConstant.PRESERVE_BED_EXCHANGE_NAME,
                RabbitMqConstant.PRESERVE_BED_ROUTING_KEY, msg);
    }
}
