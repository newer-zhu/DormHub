package com.zhuhodor;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.zhuhodor.server.PetsServerApplication;
import com.zhuhodor.server.model.pojo.Bed;
import com.zhuhodor.server.service.IBedService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest(classes = {PetsServerApplication.class})
@RunWith(SpringRunner.class)
public class TestApplication {
    @Autowired
    private IBedService bedService;

    @Test
    public void test(){
        String[] s = {"ld", "lu", "ru", "rd"};
        bedService.update(new UpdateWrapper<Bed>()
                .eq("bed_num", 1).set("position", s[0]));
        bedService.update(new UpdateWrapper<Bed>()
                .eq("bed_num", 2).set("position", s[1]));
        bedService.update(new UpdateWrapper<Bed>()
                .eq("bed_num", 3).set("position", s[2]));
        bedService.update(new UpdateWrapper<Bed>()
                .eq("bed_num", 4).set("position", s[3]));
    }
}
