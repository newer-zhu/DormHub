package com.zhuhodor.app.model.dto;

import com.zhuhodor.app.model.pojo.CheckItem;
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

    @ApiModelProperty(value = "此次操作版本号")
    private Long version;
}
