package com.zhuhodor.server;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {PetsServerApplication.class})
public class PetsServerApplication {

    @Test
    public void test(){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        String raw = "123";//前端给的明文

        //加密后存入数据库，手动粘贴进数据库
        String encode = passwordEncoder.encode(raw);

        //登录时从数据库查出密文并比较为true
        String encodeFromDB = encode;//模拟从数据库查出密文
        System.out.println(passwordEncoder.matches(raw, encode));//打印的是true
    }
}
