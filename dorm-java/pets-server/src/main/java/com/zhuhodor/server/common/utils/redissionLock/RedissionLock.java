package com.zhuhodor.server.common.utils.redissionLock;

import java.lang.annotation.*;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface RedissionLock {
    /**
     * 分布式锁的key，可以理解为前缀
     */
    String value();

    /**
     * 分布式锁的最长等待时间
     */
    long waitTime() default 60;

    /**
     * 最长持有时间
     */
    long holdTime() default 60;
}
