package com.zhuhodor.server.controller;


import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.vo.echarts.LineVo;
import com.zhuhodor.server.service.IChecklogRankService;
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
 * @since 2022-03-05
 */
@RestController
@RequestMapping("/checklog-rank")
public class ChecklogRankController {

    @Autowired
    private IChecklogRankService rankService;

    @ApiOperation("获取前十期检查平均分")
    @GetMapping("/avgScores")
    public Result<LineVo> getLastTenTimesAvgScores(){
        return Result.success(rankService.getLastTenTimesAvgScores());
    }

    @ApiOperation("近十次最高得分变化")
    @GetMapping("/maxScores")
    public Result<LineVo> getLastTenHighestScores(){
        return Result.success(rankService.getLastTenHighestScores());
    }
}
