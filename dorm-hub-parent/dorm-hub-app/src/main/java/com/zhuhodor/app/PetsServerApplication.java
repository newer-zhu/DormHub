package com.zhuhodor.app;

import com.zhuhodor.app.threadpool.MyPoolConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableCaching
@EnableAsync
@EnableConfigurationProperties({MyPoolConfig.class} ) // 开启配置属性支持
public class PetsServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(PetsServerApplication.class, args);
    }

}
