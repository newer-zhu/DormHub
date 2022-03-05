package com.zhuhodor.server.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * <p>
 *
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-05
 */
@Getter
@Setter
@TableName("p_checklog_rank")
@ApiModel(value = "ChecklogRank对象", description = "")
@AllArgsConstructor
@NoArgsConstructor
public class ChecklogRank implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("被评分寝室")
    @TableField("dorm_id")
    private Integer dormId;

    @ApiModelProperty("评分单")
    @TableField("checklog_id")
    private Integer checklogId;

    @ApiModelProperty("同期排名")
    @TableField("rank")
    private Integer rank;

    @ApiModelProperty("同期总数")
    @TableField("total")
    private Integer total;

    @ApiModelProperty("评分时间")
    @TableField("check_date")
    private LocalDate checkDate;

    @ApiModelProperty("分数")
    @TableField("score")
    private Double score;

}
