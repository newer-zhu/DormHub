package com.zhuhodor.app.aspect;

import com.zhuhodor.app.common.utils.redissionLock.RedissionLock;
import com.zhuhodor.app.common.utils.redissionLock.RedissionLockKey;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

@Component
@Aspect
@Slf4j
public class RedissionLockAspect {
    @Autowired
    private RedissonClient redissonClient;

    @Around("@annotation(com.zhuhodor.app.common.utils.redissionLock.RedissionLock)")
    public Object aroundAdvice(ProceedingJoinPoint pjp) throws Throwable {
        // 1.方法执行前的处理，相当于前置通知
        // 获取方法签名
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        // 获取方法
        Method method = methodSignature.getMethod();
        // 获取方法上面的注解
        RedissionLock distributedLock = method.getAnnotation(RedissionLock.class);
        // 获取操作描述的属性值
        String lockKey = distributedLock.value();
        long waitTime = distributedLock.waitTime();
        long holdTime = distributedLock.holdTime();

        // method获取参数信息。 如果参数带有DistributedLockKey 注解，lockKey 拼接参数的value
        Parameter[] parameters = method.getParameters();
        if (ArrayUtils.isNotEmpty(parameters)) {
            for (int index = 0, length_1 = parameters.length; index < length_1; index++) {
                RedissionLockKey annotation = parameters[index].getAnnotation(RedissionLockKey.class);
                if (annotation != null) {
                    // 获取参数值
                    Object[] args = pjp.getArgs();
                    String param = String.valueOf(args[index]);
                    if (StringUtils.isNotBlank(param)) {
                        lockKey += ":" + param;
                        break;
                    }
                }
            }
        }

//        log.info("lockKey: {}", lockKey);
        RLock fairLock = redissonClient.getFairLock(lockKey);
        boolean lock = fairLock.tryLock(waitTime, holdTime, TimeUnit.SECONDS);
        if (!lock) {
            throw new RuntimeException("获取锁失败");
        }

        Object result = null;
        try {
            //让代理方法执行
            result = pjp.proceed();
            // 2.相当于后置通知(方法成功执行之后走这里)
        } catch (SQLException e) {
            // 3.相当于异常通知部分
        } finally {
            // 4.相当于最终通知
            if (fairLock.isHeldByCurrentThread()) {
                fairLock.unlock();
            }
        }
        return result;
    }
}
