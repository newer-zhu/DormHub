package com.zhuhodor.server.model.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("p_bed")
@ApiModel(value="Bed对象", description="")
public class Bed implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "宿舍号")
    @TableField("dorm_id")
    private Integer dormId;

    @ApiModelProperty(value = "床位号")
    @TableField("bed_num")
    private String bedNum;

    @ApiModelProperty(value = "0空 1满")
    private Integer status;

    @ApiModelProperty(value = "住宿用户")
    @TableField("user_id")
    private Integer userId;

    @ApiModelProperty(value = "版本号")
    @TableField("version")
    @Version
    private Integer version;

    @ApiModelProperty(value = "是否是上下铺")
    @TableField("is_bunk")
    private Integer isBunk;

    @ApiModelProperty(value = "2上铺 1下铺")
    private Integer level;

    @ApiModelProperty(value = "位置 l r u d")
    private String position;

    @ApiModelProperty(value = "所属宿舍")
    @TableField(exist = false)
    private Dorm dorm;

    @ApiModelProperty(value = "用户")
    @TableField(exist = false)
    private User user;
}
