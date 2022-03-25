package com.zhuhodor.server.rabbitMq.config;

/**
 * RabbitMQ常量
 */
public class RabbitMqConstant {

    public static final int DELAY_TIME = 12*60*60*1000;

    public static final String DEAD_LETTER_EXCHANGE = "delay.queue.check.deadletter.exchange";
    public static final String DELAY_EXCHANGE_NAME = "delay.queue.check.business.exchange";

    public static final String DELAY_QUEUEA_NAME = "delay.queue.check.business.queuea";
    public static final String DELAY_QUEUEB_NAME = "delay.queue.check.business.queueb";
    public static final String DEAD_LETTER_QUEUEA_NAME = "delay.queue.check.deadletter.queuea";
    public static final String DEAD_LETTER_QUEUEB_NAME = "delay.queue.check.deadletter.queueb";

    public static final String DELAY_QUEUEA_ROUTING_KEY = "delay.queue.check.business.queuea.routingkey";
    public static final String DELAY_QUEUEB_ROUTING_KEY = "delay.queue.check.business.queueb.routingkey";
    public static final String DEAD_LETTER_QUEUEA_ROUTING_KEY = "delay.queue.check.deadletter.delay_12h.routingkey";
    public static final String DEAD_LETTER_QUEUEB_ROUTING_KEY = "delay.queue.check.deadletter.delay_xh.routingkey";

}
