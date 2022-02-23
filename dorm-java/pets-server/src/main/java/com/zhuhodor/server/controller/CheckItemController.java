package com.zhuhodor.server.controller;


import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.dto.CheckItemUpdateDTO;
import com.zhuhodor.server.model.pojo.CheckItem;
import com.zhuhodor.server.service.ICheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping()
    public Result getCheckItem(){
        return Result.success(checkItemService.getAllCheckItems());
    }

    @GetMapping("/enabled")
    public Result getEnabledCheckItems(){
        return Result.success(checkItemService.getEnabledCheckItems());
    }

//    @PostMapping()
//    public Result updateCheckItem(@RequestBody List<CheckItem> newItems){
//        checkItemService.updateBatchById(newItems);
//        return Result.success("修改成功！");
//    }

    @PostMapping("/update")
    public Result updateCheckItems(@RequestBody CheckItemUpdateDTO dto){
        return checkItemService.updateCheckItems(dto);
    }
}
