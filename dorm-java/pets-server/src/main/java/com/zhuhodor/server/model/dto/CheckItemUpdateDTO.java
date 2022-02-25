package com.zhuhodor.server.model.dto;

import com.zhuhodor.server.model.pojo.CheckItem;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class CheckItemUpdateDTO {
    @ApiModelProperty(value = "新增检查项")
    private List<CheckItem> newItems;

    @ApiModelProperty(value = "停用检查项Id集合")
    private List<Integer> disabledList;

    @ApiModelProperty(value = "启用检查项Id集合（不包括新增检查项）")
    private List<Integer> enabledList;
}