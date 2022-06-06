package com.zhuhodor.app.model.pojo;

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
 * @since 2021-08-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("p_dorm")
@ApiModel(value="Dorm对象", description="寝室对象")
public class Dorm implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "楼号")
    @TableField("building_id")
    private String buildingId;

    @ApiModelProperty(value = "寝室长")
    @TableField("admin")
    private Integer admin;

    @ApiModelProperty(value = "宿舍号码")
    @TableField("dorm_id")
    private String dormId;

    @ApiModelProperty(value = "层数")
    private Integer floor;

    @ApiModelProperty(value = "宿舍容量")
    private Integer capacity;

    @ApiModelProperty(value = "被占床位")
    private Integer occupation;

    @TableField(exist = false)
    @ApiModelProperty(value = "住宿成员")
    List<User> members;

    @TableField(exist = false)
    @ApiModelProperty(value = "床位")
    List<Bed> beds;
}
