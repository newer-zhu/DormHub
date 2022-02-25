package com.zhuhodor.server.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 全局跨域配置
 */
@Configuration
public class GlobalCorsConfig implements WebMvcConfigurer {
//    @Bean
//    public CorsFilter corsFilter(){
//        CorsConfiguration configuration = new CorsConfiguration();
//        //允许所有域名进行跨域调用
//        configuration.addAllowedOriginPattern("*");
//        //允许跨域发送cookie
//        configuration.setAllowCredentials(true);
//        //放行全部原始头信息
//        configuration.addAllowedHeader("*");
//        //允许所有请求方法跨域调用
//        configuration.addAllowedMethod("*");
//        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//        source.registerCorsConfiguration("/**",configuration);
//        return new CorsFilter(source);
//    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowedMethods("GET", "HEAD", "POST", "PUT", "DELETE", "OPTIONS")
                .allowCredentials(true)
                .maxAge(3600)
                .allowedHeaders("*");
    }
}
