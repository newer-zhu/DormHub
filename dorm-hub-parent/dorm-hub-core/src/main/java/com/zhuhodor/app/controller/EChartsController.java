package com.zhuhodor.app.controller;


import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.vo.echarts.LineVo;
import com.zhuhodor.app.model.vo.echarts.PieVo;
import com.zhuhodor.app.service.IEChartsService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-05
 */
@RestController
@RequestMapping("/eCharts")
public class EChartsController {

    @Autowired
    private IEChartsService eChartsService;

    @ApiOperation("获取前十期检查平均分")
    @GetMapping("/avgScores")
    public Result<LineVo> getLastTenTimesAvgScores(){
        return Result.success(eChartsService.getLastTenTimesAvgScores());
    }

    @ApiOperation("近十次最高得分变化")
    @GetMapping("/maxScores")
    public Result<LineVo> getLastTenHighestScores(){
        return Result.success(eChartsService.getLastTenHighestScores());
    }

    @ApiOperation("分数区间占比")
    @GetMapping("/countScores")
    public Result<List<PieVo>> getLatestScoreAccount(){
        return Result.success(eChartsService.getLatestScoreAccount());
    }

    @ApiOperation("平均分排行")
    @GetMapping("/rankedAvgScores")
    public Result<LineVo> getRankedAvgScores(){
        return Result.success(eChartsService.getRankedAvgScores());
    }
}
