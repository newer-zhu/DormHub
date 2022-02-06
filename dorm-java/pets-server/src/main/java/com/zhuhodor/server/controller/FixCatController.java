package com.zhuhodor.server.controller;


import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.service.IFixCatService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
