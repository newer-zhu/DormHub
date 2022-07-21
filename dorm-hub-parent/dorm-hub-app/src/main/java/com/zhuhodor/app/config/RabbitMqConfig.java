package com.zhuhodor.app.config;


import com.zhuhodor.app.common.constant.RabbitMqConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
@Slf4j
public class RabbitMqConfig {
    @Autowired
    private CachingConnectionFactory cachingConnectionFactory;

    @Bean
    public RabbitTemplate rabbitTemplate(){
        RabbitTemplate rabbitTemplate = new RabbitTemplate(cachingConnectionFactory);

        //设置开启Mandatory,才能触发回调函数,无论消息推送结果怎么样都强制调用回调函数
//        rabbitTemplate.setMandatory(true);
        /**
         * 消息确认回调，确认消息是否到达broker
         * correlationData： 消息唯一标识
         * b: 确认结果
         * s: 失败原因
         */
        rabbitTemplate.setConfirmCallback(((correlationData, ack, cause) -> {
            String msgId = correlationData.getId();
            if (ack){
                log.info("{}====================>消息发送成功", msgId);
            }else {
                log.error("{}============消息发送失败", msgId);
            }
        }));
        /**
         * 消息失败回调，比如router不到queue时回调
         * message:消息主题
         * repCode:响应码
         * repText:响应描述* exchange:交换机
         * * routingKey:路由键
         * */
        rabbitTemplate.setReturnsCallback((msg)->{
            log.info("{}==消息发送到queue时失败,重试",msg.getMessage().getMessageProperties().getDeliveryTag());
            //重试保证消息到broker这一步不会丢失
            rabbitTemplate.convertAndSend(RabbitMqConstant.DELAY_EXCHANGE_NAME,
                    RabbitMqConstant.DELAY_QUEUEA_ROUTING_KEY, msg.getMessage());
        });
        rabbitTemplate.setMessageConverter(new Jackson2JsonMessageConverter());

        return rabbitTemplate;
    }

    // 业务延时队列
    // 绑定到对应的死信交换机
    @Bean
    public Queue delayQueueA(){
        // durable:是否持久化,默认是false,持久化队列：会被存储在磁盘上，当消息代理重启时仍然存在，暂存队列：当前连接有效
        // exclusive:默认也是false，只能被当前创建的连接使用，而且当连接关闭后队列即被删除。此参考优先级高于durable
        // autoDelete:是否自动删除，当没有生产者或者消费者使用此队列，该队列会自动删除。
        //   return new Queue("DirectQueue",true,true,false);

        Map<String, Object> args = new HashMap<>(2);
        // x-dead-letter-exchange    这里声明当前队列绑定的死信交换机
        args.put("x-dead-letter-exchange", RabbitMqConstant.DEAD_LETTER_EXCHANGE);
        // x-dead-letter-routing-key  这里声明当前队列的死信路由key
        args.put("x-dead-letter-routing-key", RabbitMqConstant.DEAD_LETTER_QUEUEA_ROUTING_KEY);
        // x-message-ttl  声明队列的TTL
        args.put("x-message-ttl", RabbitMqConstant.DELAY_TIME);
        return QueueBuilder.durable(RabbitMqConstant.DELAY_QUEUEA_NAME).withArguments(args).build();
    }

    // 声明死信队列A 用于接收延时处理的消息
    @Bean
    public Queue deadLetterQueueA(){
        return new Queue(RabbitMqConstant.DEAD_LETTER_QUEUEA_NAME);
    }

    //抢到床位后进入此队列
    @Bean
    public Queue preserveBedQueue(){
        return QueueBuilder.durable(RabbitMqConstant.PRESERVE_BED_QUEUE_NAME).lazy().build();
    }


    //延时业务交换机
    @Bean
    public DirectExchange delayDirectExchange() {
        //autoDelete 没有任何消费者就自动删除
        return new DirectExchange(RabbitMqConstant.DELAY_EXCHANGE_NAME,true,false);
    }

    //预约床位业务交换机
    @Bean
    public DirectExchange preserveBedExchange() {
        return new DirectExchange(RabbitMqConstant.PRESERVE_BED_EXCHANGE_NAME,true,false);
    }

    //死信交换机
    @Bean
    public DirectExchange deadLetterExchange() {
        //autoDelete 没有任何消费者就自动删除
        return new DirectExchange(RabbitMqConstant.DEAD_LETTER_EXCHANGE,true,false);
    }

    // 声明延时队列A绑定关系
    @Bean
    public Binding delayBindingA(@Qualifier("delayQueueA") Queue queue,
                                 @Qualifier("delayDirectExchange") DirectExchange exchange){
        return BindingBuilder.bind(queue).to(exchange).with(RabbitMqConstant.DELAY_QUEUEA_ROUTING_KEY);
    }

    // 声明死信队列A绑定关系
    @Bean
    public Binding deadLetterBindingA(@Qualifier("deadLetterQueueA") Queue queue,
                                      @Qualifier("deadLetterExchange") DirectExchange exchange){
        return BindingBuilder.bind(queue).to(exchange).with(RabbitMqConstant.DEAD_LETTER_QUEUEA_ROUTING_KEY);
    }

    //声明预约功能的绑定关系
    @Bean
    public Binding preserveBinding(@Qualifier("preserveBedQueue") Queue queue,
                                 @Qualifier("preserveBedExchange") DirectExchange exchange){
        return BindingBuilder.bind(queue).to(exchange).with(RabbitMqConstant.PRESERVE_BED_ROUTING_KEY);
    }

}
