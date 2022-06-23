package com.zhuhodor.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableCaching
@EnableAsync
@MapperScan("com.zhuhodor.server.mapper")
public class PetsServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(PetsServerApplication.class, args);
    }

}
