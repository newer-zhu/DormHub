package com.zhuhodor.server.model.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 *前端图表的vo
 */
@Data
public class GraphVo {

    @ApiModelProperty(value = "x坐标")
    private String x;

    @ApiModelProperty(value = "y坐标")
    private Integer y;

}
