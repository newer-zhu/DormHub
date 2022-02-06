package com.zhuhodor.server;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
//@ComponentScan(basePackages={"cn.hutool.extra.spring"})
@MapperScan("com.zhuhodor.server.mapper")
public class PetsServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(PetsServerApplication.class, args);
    }
}
