package com.zhuhodor.server.controller;


import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.FixCat;
import com.zhuhodor.server.model.vo.echarts.FixCatPieVo;
import com.zhuhodor.server.service.IFixCatService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-06
 */
@RestController
@RequestMapping("/fix-cat")
public class FixCatController {
    @Autowired
    private IFixCatService fixCatService;

    @ApiOperation("获取所有分类")
    @GetMapping()
    public Result getAllCats(){
        return Result.success(fixCatService.list());
    }

    @ApiOperation("更新分类")
    @PutMapping()
    public Result updateCat(@RequestBody FixCat cat){
        if (fixCatService.updateById(cat)){
            return Result.success(null);
        }
        return Result.fail("服务器出错了");
    }

    @ApiOperation("新增分类")
    @PostMapping()
    public Result saveCat(@RequestBody FixCat cat){
        if (fixCatService.save(cat)){
            return Result.success("保存成功");
        }
        return Result.fail("服务器出错了");
    }

    @ApiOperation("获取饼图")
    @GetMapping("/pie")
    public Result<List<FixCatPieVo>> getPie(){
        return Result.success(fixCatService.getPie());
    }
}
