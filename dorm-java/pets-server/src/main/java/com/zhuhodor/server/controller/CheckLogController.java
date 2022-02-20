package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.CheckLog;
import com.zhuhodor.server.model.vo.CheckLogVo;
import com.zhuhodor.server.model.vo.condition.LogSearchVo;
import com.zhuhodor.server.service.ICheckLogService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  检查分数表单控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-20
 */
@RestController
@RequestMapping("/checkLog")
public class CheckLogController {
    @Autowired
    private ICheckLogService checkLogService;

    @PostMapping()
    @ApiOperation(value = "保存检查表")
    public Result saveLog(@RequestBody CheckLogVo checkLogVo, Principal principal){
        if (checkLogService.list(new QueryWrapper<CheckLog>()
                .eq("check_time", LocalDate.now().toString())
                .eq("target_dorm", checkLogVo.getTargetDorm())).size() > 0){
            return Result.fail("不要重复评分！");
        }else {
            checkLogVo.setCheckUsername(principal.getName());
            checkLogVo.setCheckTime(LocalDate.now());
            checkLogService.saveLog(checkLogVo);
            return Result.success("保存成功");
        }
    }

    @GetMapping("/dorm/{dormId}/{time}")
    @ApiOperation(value = "根据宿舍Id获取检查表记录")
    public Result getLogByDormId(@PathVariable Integer dormId, @PathVariable String time){
        CheckLogVo checkLogVo = checkLogService.getLogByDormId(dormId, time);
        return Result.success(checkLogVo);
    }

    @GetMapping("/time/{dormId}")
    @ApiOperation(value = "根据宿舍Id获取检查时间批次")
    public Result getLogTimeByDormId(@PathVariable Integer dormId){
        List<CheckLog> list = checkLogService.list(new QueryWrapper<CheckLog>()
                .eq("target_dorm", dormId).select("check_time").orderByDesc("check_time"));
        ArrayList<String> times = new ArrayList<>();
        for (CheckLog c : list){
            times.add(c.getCheckTime().toString());
        }
        return Result.success(times);
    }

    @GetMapping("/time")
    @ApiOperation(value = "获取检查时间批次")
    public Result getLogTime(){
        List<CheckLog> list = checkLogService.list(new QueryWrapper<CheckLog>()
                .select("check_time").orderByDesc("check_time"));
        ArrayList<String> times = new ArrayList<>();
        for (CheckLog c : list){
            times.add(c.getCheckTime().toString());
        }
        return Result.success(times);
    }

    @PostMapping("/search/{cur}")
    @ApiOperation(value = "根据条件查询记录")
    public Result getLogsByCon(@RequestBody LogSearchVo logSearchVo, @PathVariable Integer cur){
        IPage<CheckLogVo> page = new Page<>(cur,7);
        List<CheckLogVo> list = checkLogService.getLogsByCondition(page, logSearchVo);
        page.setRecords(list);
        return Result.success(page);
    }


    @GetMapping("/analysis/{dormId}")
    @ApiOperation(value = "移动端根据宿舍Id获取折线图")
    public Result getAnalysisByDormId(@PathVariable Integer dormId){
        return Result.success(checkLogService.getAnalysisByDormId(dormId));
    }
}
