package com.zhuhodor.app.rabbitmq.consumer;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.rabbitmq.client.Channel;
import com.zhuhodor.app.common.constant.RabbitMqConstant;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.mapper.BedMapper;
import com.zhuhodor.app.mapper.DormMapper;
import com.zhuhodor.app.mapper.UserMapper;
import com.zhuhodor.app.model.dto.MqTransferDTO;
import com.zhuhodor.app.model.pojo.Bed;
import com.zhuhodor.app.model.pojo.Post;
import com.zhuhodor.app.model.pojo.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.LocalDateTime;

/**
 * @author: Hodor_Zhu
 * @description 预约床位信息消费者
 * @date: 2022/7/20 18:02
 */
@Component
@Slf4j
public class PreserveBedConsumer {
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DormMapper dormMapper;
    @Autowired
    private BedMapper bedMapper;

    @Transactional(rollbackFor = Exception.class)
    @RabbitListener(queues = RabbitMqConstant.PRESERVE_BED_QUEUE_NAME)
    public void concumer(Message message, Channel channel) throws IOException {
        channel.basicQos(1);
        MqTransferDTO<Bed> dto = (MqTransferDTO<Bed>)rabbitTemplate.getMessageConverter().fromMessage(message);
        Bed bed = dto.getData();

        log.info("预约床位队列A收到消息：{}", bed.toString());

        if (1 == dormMapper.occupationIncr(bed.getDormId(), 1) &&
                //更新用户表的寝室信息
                1 == userMapper.update(null, new UpdateWrapper<User>()
                .eq("id", bed.getUserId())
                .set("dorm_id", bedMapper.selectOne(new QueryWrapper<Bed>()
                        .eq("id", bed.getId())
                        .select("dorm_id")).getDormId()))){
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        }else {
            channel.basicNack(message.getMessageProperties().getDeliveryTag(),false,true);
        }
    }
}
