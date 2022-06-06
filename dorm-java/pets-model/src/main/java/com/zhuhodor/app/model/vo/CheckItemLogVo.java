package com.zhuhodor.app.model.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@TableName("p_checkitem_log")
public class CheckItemLogVo {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "检查项")
    @TableField("item_id")
    private Integer itemId;

    @ApiModelProperty(value = "检查项内容")
    private String item;

    @ApiModelProperty(value = "是否启用")
    private Boolean enabled;

    @ApiModelProperty(value = "检查项满分")
    @TableField("item_score")
    private Integer itemScore;

    @ApiModelProperty(value = "每项分数")
    private Integer score;

    @ApiModelProperty(value = "父检查项")
    @TableField("parent_item")
    private Integer parentItem;

    @ApiModelProperty(value = "所属检查表")
    @TableField("check_log")
    private Integer checkLog;
}
