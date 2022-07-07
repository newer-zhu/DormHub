package com.zhuhodor.app.model.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class CheckLogAnalysisVo {

    @ApiModelProperty(value = "得分图表坐标")
    private List<GraphVo> points;

    @ApiModelProperty(value = "平均分")
    private Float average;

    @ApiModelProperty(value = "历史最高分")
    private Integer maxScore;

    @ApiModelProperty(value = "历史最低分")
    private Integer minScore;

    @ApiModelProperty(value = "不及格次数")
    private Integer fail;

}
