package com.zhuhodor.app.model.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class BedInfo {

    @ApiModelProperty(value = "床位Id")
    private Integer bId;

    @ApiModelProperty(value = "寝室Id")
    private Integer dId;

    @ApiModelProperty(value = "床号")
    private String bedNum;

    @ApiModelProperty(value = "状态 0空1满")
    private Integer status;

    @ApiModelProperty(value = "所在楼栋")
    private String buildingId;

    @ApiModelProperty(value = "寝室门牌号")
    private String dormId;

    @ApiModelProperty(value = "容量")
    private Integer capacity;

    @ApiModelProperty(value = "楼层")
    private Integer floor;
}
