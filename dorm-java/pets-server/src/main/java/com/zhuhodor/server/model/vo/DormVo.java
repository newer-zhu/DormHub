package com.zhuhodor.server.model.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class DormVo {

    private Integer id;

    @ApiModelProperty(value = "楼号")
    private String buildingId;

    private String dormId;
}
