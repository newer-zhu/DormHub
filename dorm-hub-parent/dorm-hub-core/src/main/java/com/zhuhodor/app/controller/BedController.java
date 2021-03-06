package com.zhuhodor.app.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.pojo.Bed;
import com.zhuhodor.app.service.IBedService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-12
 */
@RestController
@RequestMapping("/bed")
public class BedController {
    @Autowired
    private IBedService bedService;

    @ApiOperation(value = "预约床位")
    @GetMapping("/freshman/appointment")
    public Result makeAppointment(@RequestParam("userId") Integer userId, @RequestParam("bedId") Integer bedId){
        return bedService.reserve(userId, bedId);
    }

    @ApiOperation(value = "取消预约床位")
    @DeleteMapping("/freshman/appointment")
    public Result cancelAppointment(@RequestParam("userId") Integer userId, @RequestParam("bedId") Integer bedId){
        if (bedService.cancel(userId, bedId)){
            return Result.success("取消预约成功!");
        }else {
            return Result.success("取消预约失败!");
        }
    }

    @ApiOperation(value = "分配床位")
    @GetMapping("/allocate")
    public Result allocate(@RequestParam("uid") Integer uid, @RequestParam("bedId") Integer bedId){
        if (bedService.allocateBed(bedId, uid)){
            return Result.success("分配成功!");
        }else {
            return Result.fail("分配失败!");
        }
    }

    @ApiOperation(value = "根据userId获取床位信息")
    @GetMapping("/info/{userId}")
    public Result makeAppointment(@PathVariable("userId") Integer userId){
        return Result.success(bedService.getBedInfoByUserId(userId));
    }

    @ApiOperation(value = "获取寝室下的床位")
    @GetMapping("/dorm/{dormId}")
    public Result getBedsByDormId(@PathVariable("dormId") Integer dormId){
        List<Bed> beds = bedService.list(new QueryWrapper<Bed>().eq("dorm_id", dormId));
        HashMap<String, Bed> res = new HashMap<>();
        for (Bed b : beds){
            res.put(b.getPosition(), b);
        }
        return Result.success(res);
    }

    @ApiOperation(value = "获取寝室下的床位及用户")
    @GetMapping("/dorm/PC/{dormId}")
    public Result getBedsByDormIdFromPc(@PathVariable("dormId") Integer dormId){
        return Result.success(bedService.getBedsByDormIdFromPc(dormId));
    }

}
