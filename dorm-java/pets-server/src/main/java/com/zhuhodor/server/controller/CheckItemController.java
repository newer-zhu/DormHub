package com.zhuhodor.server.controller;


import cn.hutool.core.map.MapUtil;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.dto.CheckItemUpdateDTO;
import com.zhuhodor.server.service.ICheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.atomic.AtomicLong;

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
    //版本号
    private volatile AtomicLong version = new AtomicLong(0L);

    @GetMapping("/update")
    public Result getCheckItem(Authentication authentication){
        return Result.success(MapUtil.builder()
                .put("items", checkItemService.getAllCheckItems())
                .put("version", version.get()).build());
    }


    @GetMapping("/enabled")
    public Result getEnabledCheckItems(Authentication authentication){
        return Result.success(checkItemService.getEnabledCheckItems());
    }

    @PostMapping("/update")
    public Result updateCheckItems(@RequestBody CheckItemUpdateDTO dto, Authentication authentication){
        if (version.compareAndSet(dto.getVersion(), dto.getVersion()+1)){
            return checkItemService.updateCheckItems(dto);
        }else {
            return Result.fail("此次操作失效，请重试");
        }

    }
}
