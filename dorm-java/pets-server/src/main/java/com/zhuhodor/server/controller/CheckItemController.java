package com.zhuhodor.server.controller;


import cn.hutool.core.map.MapUtil;
import com.zhuhodor.server.common.constant.RedisConstant;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.dto.CheckItemUpdateDTO;
import com.zhuhodor.server.service.ICheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.scripting.support.ResourceScriptSource;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

/**
 * <p>
 *  检查项控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-19
 */
@RestController
@RequestMapping("/checkItem")
public class CheckItemController {
    @Autowired
    private ICheckItemService checkItemService;
    @Autowired
    private RedisTemplate redisTemplate;
    //版本号,此种方案只能单机加锁
//    private volatile AtomicLong version = new AtomicLong(0L);

    @GetMapping("/update")
    public Result getCheckItem(Authentication authentication){
        return Result.success(MapUtil.builder()
                .put("items", checkItemService.getAllCheckItems())
                .put("version", redisTemplate.opsForValue().get(RedisConstant.itemUpdateLock.getValue()))
                .build());
    }

    @GetMapping("/enabled")
    public Result getEnabledCheckItems(Authentication authentication){
        return Result.success(checkItemService.getEnabledCheckItems());
    }

    @PostMapping("/update")
    public Result updateCheckItems(@RequestBody CheckItemUpdateDTO dto, Authentication authentication){
            try {
                DefaultRedisScript<Long> script = new DefaultRedisScript<>();
                script.setResultType(Long.class);
                script.setScriptSource(new ResourceScriptSource(new ClassPathResource("redis/redis_lock.lua")));
                String key = RedisConstant.itemUpdateLock.getValue();
                Object execute = redisTemplate.execute(script, Arrays.asList(key), dto.getVersion(), dto.getVersion() + 1);
                if (String.valueOf(execute).equals("1")){
                    return checkItemService.updateCheckItems(dto);
                }else {
                    return Result.fail("此次操作失效，请重试");
                }
            }catch (Exception e){
                e.printStackTrace();
                return Result.fail("此次操作失败");
            }

        //atomic解决方案，不能分布式
//        if (version.compareAndSet(dto.getVersion(), dto.getVersion()+1)){
//            return checkItemService.updateCheckItems(dto);
//        }
    }
}
