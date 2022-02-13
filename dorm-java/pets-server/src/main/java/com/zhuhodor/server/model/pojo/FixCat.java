package com.zhuhodor.server.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-06
 */
@Getter
@Setter
@TableName("p_fix_cat")
@ApiModel(value = "FixCat对象", description = "")
public class FixCat implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("分类名字")
    @TableField("category")
    private String category;

    @ApiModelProperty("优先级,升序")
    @TableField("priority")
    private Integer priority;
}
