package com.zhuhodor.server.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("p_checkitem")
@ApiModel(value="Checkitem对象", description="")
public class CheckItem implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "检查项")
    private String item;

    @ApiModelProperty(value = "每项分数")
    private Integer score;

    @ApiModelProperty(value = "父检查项")
    @TableField("parent_item")
    private Integer parentItem;

    @ApiModelProperty(value = "子检查项")
    @TableField(exist = false)
    private List<CheckItem> childrenItem;

}
