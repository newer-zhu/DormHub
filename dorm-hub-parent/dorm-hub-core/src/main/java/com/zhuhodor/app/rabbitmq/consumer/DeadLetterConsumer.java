package com.zhuhodor.app.rabbitmq.consumer;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.rabbitmq.client.Channel;
import com.zhuhodor.app.common.constant.RabbitMqConstant;
import com.zhuhodor.app.service.IPostService;
import com.zhuhodor.app.model.pojo.Post;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;

/**
 * 死信队列消费者
 */
@Component
@Slf4j
public class DeadLetterConsumer {
    @Autowired
    private IPostService postService;
    @Autowired
    private RabbitTemplate rabbitTemplate;

    @RabbitListener(queues = RabbitMqConstant.DEAD_LETTER_QUEUEA_NAME)
    public void receiveA(Message message, Channel channel) throws IOException {
        channel.basicQos(1);
        Post post = (Post)rabbitTemplate.getMessageConverter().fromMessage(message);
        log.info("死信队列A收到消息：{}", post.toString());
        //数据库里的最新更新时间
        LocalDateTime lastTime = postService.getOne(new QueryWrapper<Post>().eq("id", post.getId()).select("time")).getTime();
        //队列里的消息是最新的
        if (lastTime.compareTo(post.getTime()) < 5){
            if (postService.update(new UpdateWrapper<Post>()
                    .eq("id", Integer.valueOf(post.getId()))
                    .set("status", 1))){
                channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
            }else {
                //消费失败，放回队列
                channel.basicNack(message.getMessageProperties().getDeliveryTag(),false,true);
            }
        }else {
            log.info("丢弃死信队列A的消息");
            //不是最新的，直接丢弃
            channel.basicNack(message.getMessageProperties().getDeliveryTag(),false,false);
        }
    }

}
