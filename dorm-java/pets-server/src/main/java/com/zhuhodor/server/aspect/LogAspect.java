package com.zhuhodor.server.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Component
@Aspect
@Slf4j
public class LogAspect {
    /**
     * execution: 匹配连接点 execution(方法修饰符(可选)  返回类型  类路径 方法名  参数  异常模式(可选))
     *within: 某个类里面
     *this: 指定AOP代理类的类型
     *target:指定目标对象的类型
     *args: 指定参数的类型
     *bean:指定特定的bean名称，可以使用通配符（Spring自带的）
     *@target： 带有指定注解的类型
     *@args: 指定运行时传的参数带有指定的注解
     *@within: 匹配使用指定注解的类
     *@annotation:指定方法所应用的注解 */
    @Pointcut("execution(public * com.zhuhodor.server.controller..*.*(..))")//切入点描述 这个是controller包的切入点
    public void controllerLog(){}//签名，可以理解成这个切入点的一个名称

    @Before("controllerLog()") //在切入点的方法run之前要干的
    public void logBeforeController(JoinPoint joinPoint) {
        //这个RequestContextHolder是Springmvc提供来获得请求的东西
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes)requestAttributes).getRequest();

        // 记录下请求内容
        log.info("################URL : " + request.getRequestURL().toString());
        log.info("################HTTP_METHOD : " + request.getMethod());
        log.info("################IP : " + request.getRemoteAddr());
        log.info("################THE ARGS OF THE CONTROLLER : " + Arrays.toString(joinPoint.getArgs()));

        //下面这个getSignature().getDeclaringTypeName()是获取包+类名的   然后后面的joinPoint.getSignature.getName()获取了方法名
        log.info("################CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        //log.info("################TARGET: " + joinPoint.getTarget());//返回的是需要加强的目标类的对象
        //log.info("################THIS: " + joinPoint.getThis());//返回的是经过加强后的代理类的对象

    }
}
