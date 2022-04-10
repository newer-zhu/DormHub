package com.zhuhodor.server.common.utils.redissionLock;

import java.lang.annotation.*;

@Target({ElementType.PARAMETER, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface RedissionLockKey {
}
