package com.zhuhodor.app.aspect;

import com.zhuhodor.app.common.constant.RedisConstant;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.common.utils.IpUtil;
import com.zhuhodor.app.common.utils.RedisUtil;
import com.zhuhodor.app.model.pojo.Ip2CityEntity;
import com.zhuhodor.app.common.utils.GeoIpUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
@Aspect
@Slf4j
public class LogAspect {
    @Autowired
    private RedisUtil redisUtil;

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
    @Pointcut("execution(public * com.zhuhodor.app.service.impl.UserServiceImpl.login(..))")//切入点描述
    public void LoginLog(){}//签名，可以理解成这个切入点的一个名称

    @AfterReturning(value = "LoginLog()", returning = "result") //在切入点的方法之后
    public void afterLogController(JoinPoint joinPoint, Result result) {

        String iPAddr = IpUtil.getIp();

        Ip2CityEntity ipInfo = GeoIpUtil.getIpInfo(iPAddr);

        if (result.getCode() == 200){
            String key = RedisConstant.loginLog.getValue();

            Object[] args = joinPoint.getArgs();
            String time = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(LocalDateTime.now());
            String log = "";
            if (ipInfo != null){
                 log = "用户【"+args[0]+"】 IP【"+iPAddr+"】 时间【"+ time +"】地点【"+ipInfo.getCity()+"】";
            }else {
                 log = "用户【"+args[0]+"】 IP【"+iPAddr+"】 时间【"+ time +"】";
            }
            redisUtil.lpush(key, log);
        }else {
            log.info("IP地址【{}】登录失败", iPAddr);
        }
    }
}
