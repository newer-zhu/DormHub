package com.zhuhodor.app.common.constant;

/**
 * RabbitMQ常量
 */
public class RabbitMqConstant {
    /**
     * 延时队列配置
     */
    public static final int DELAY_TIME = 12*60*60*1000;

    public static final String DEAD_LETTER_EXCHANGE = "delay.queue.check.deadletter.exchange";
    public static final String DELAY_EXCHANGE_NAME = "delay.queue.check.business.exchange";
    public static final String DELAY_QUEUEA_NAME = "delay.queue.check.business.queuea";
    public static final String DEAD_LETTER_QUEUEA_NAME = "delay.queue.check.deadletter.queuea";
    public static final String DELAY_QUEUEA_ROUTING_KEY = "delay.queue.check.business.queuea.routingkey";
    public static final String DEAD_LETTER_QUEUEA_ROUTING_KEY = "delay.queue.check.deadletter.delay_12h.routingkey";

    /**
     * 床位预约配置
     */
    public static final String PRESERVE_BED_EXCHANGE_NAME = "normal.queue.preserve.business.exchange";
    public static final String PRESERVE_BED_QUEUE_NAME = "normal.queue.preserve.business.queue";
    public static final String PRESERVE_BED_ROUTING_KEY = "normal.queue.preserve.business.routingkey";

}
