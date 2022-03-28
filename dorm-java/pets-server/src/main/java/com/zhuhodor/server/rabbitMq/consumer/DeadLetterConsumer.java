package com.zhuhodor.server.rabbitMq.consumer;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.rabbitmq.client.Channel;
import com.zhuhodor.server.model.pojo.Post;
import com.zhuhodor.server.rabbitMq.config.RabbitMqConstant;
import com.zhuhodor.server.service.IPostService;
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
                channel.basicNack(message.getMessageProperties().getDeliveryTag(),false,true);
            }
        }else {
            log.info("丢弃死信队列A的消息");
            //不是最新的，直接丢弃
            channel.basicNack(message.getMessageProperties().getDeliveryTag(),false,false);
        }
    }

//    @RabbitListener(queues = RabbitMqConstant.DEAD_LETTER_QUEUEB_NAME)
//    public void receiveB(Message message, Channel channel) throws IOException {
//        String msg = new String(message.getBody());
//        log.info("当前时间：{},死信队列B收到消息：{}", new Date().toString(), msg);
//        channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
//    }
}
