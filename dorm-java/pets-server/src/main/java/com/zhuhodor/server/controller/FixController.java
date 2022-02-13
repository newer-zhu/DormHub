package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.Fix;
import com.zhuhodor.server.service.IFixService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
@RestController
@RequestMapping("/fix")
public class FixController {
    @Autowired
    private IFixService fixService;

    @ApiOperation("保存报修单")
    @PostMapping("/save")
    public Result saveFixReport(@RequestBody Fix report){
        report.setCreateTime(LocalDateTime.now());
        report.setStatus(0);
        if (report.getId() == null && fixService.save(report)){
            return Result.success("保存成功！", report);
        }else if (report.getId() != null && fixService.updateById(report)){
            return Result.success("保存成功！", report);
        }else {
            return Result.fail("提交出错了!");
        }
    }

    @ApiOperation("根据条件获取报修单")
    @GetMapping("/table/{cur}")
    public Result getFixReportsByCon(@PathVariable("cur") Integer cur){
        IPage<Fix> page = new Page(cur, 7);
        List<Fix> list = fixService.getFixReportsByCondition(page);
        page.setRecords(list);
        return Result.success(page);
    }

    @ApiOperation("完成报修单")
    @GetMapping("/table/finish/{id}")
    public Result finishFixReportsById(@PathVariable("id") Integer id){
        fixService.update(new UpdateWrapper<Fix>()
                .eq("id", id).set("status", 1));
        return Result.success("维修成功");
    }

    @ApiOperation("软删除报修单")
    @GetMapping("/softDel/{id}")
    public Result softDelFixReport(@PathVariable("id") Integer id){
        fixService.update(new UpdateWrapper<Fix>().eq("id", id).set("status", -1));
        return Result.success("删除成功！");
    }

    @ApiOperation("删除报修单")
    @DeleteMapping("/{id}")
    public Result delFixReport(@PathVariable("id") Integer id){
        if (fixService.deleteById(id)){
            return Result.success("删除成功！");
        }
        return Result.fail("删除出错了！");
    }

    @ApiOperation("根据用户Id获取报修单")
    @GetMapping("/user/{userId}")
    public Result getFixReportByUserId(@PathVariable("userId") Integer userId){
        return Result.success(fixService.getFixReportsByUserId(userId));
    }

    @ApiOperation("根据宿舍Id获取报修单")
    @GetMapping("/dorm/{dormId}")
    public Result getFixReportByDormId(@PathVariable("dormId") Integer dormId){
        return Result.success(fixService.getFixReportsByDormId(dormId));
    }

    @ApiOperation("根据Id获取报修单")
    @GetMapping("/{id}")
    public Result getFixReportById(@PathVariable("id") Integer id){
        return Result.success(fixService.getFixReportById(id));
    }

}
