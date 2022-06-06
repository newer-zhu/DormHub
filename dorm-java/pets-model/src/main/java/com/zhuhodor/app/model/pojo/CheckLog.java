package com.zhuhodor.app.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * <p>
 *
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("p_check_log")
@ApiModel(value="CheckLog对象", description="")
public class CheckLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "总分")
    @TableField("total_score")
    private Integer totalScore;

    @ApiModelProperty(value = "检查时间")
    @TableField("check_time")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @JsonDeserialize(using = LocalDateDeserializer.class)
    @JsonSerialize(using = LocalDateSerializer.class)
    private LocalDate checkTime;

    @ApiModelProperty(value = "打分寝室")
    @TableField("target_dorm")
    private Integer targetDorm;

    @ApiModelProperty(value = "检查人员")
    private String checkUsername;

    @ApiModelProperty(value = "排名")
    private Integer rank;

    @ApiModelProperty(value = "同期总数")
    private Integer total;

    @ApiModelProperty(value = "备注")
    private String note;
}
