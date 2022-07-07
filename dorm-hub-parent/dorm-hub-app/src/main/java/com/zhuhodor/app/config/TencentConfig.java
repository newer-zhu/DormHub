package com.zhuhodor.app.config;

import com.zhuhodor.app.common.utils.TencentCos;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TencentConfig {
    @Value("${cos.secretId}")
    private String secretId;
    @Value("${cos.secretKey}")
    private String secretKey;
    @Value("${cos.regionAddr}")
    private String regionAddr;
    @Value("${cos.bucketName}")
    private String bucketName;
    @Value("${cos.remoteAddr}")
    private String remoteAddr;

    @Bean
    public TencentCos tencentCos(){
        return new TencentCos(secretId, secretKey, regionAddr, bucketName, remoteAddr);
    }
}
