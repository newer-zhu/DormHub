package com.zhuhodor.server.model.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class CheckLogVo {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "取得的总分")
    @TableField("total_score")
    private Integer totalScore;

    @ApiModelProperty(value = "检查时间")
    @TableField("check_time")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @JsonDeserialize(using = LocalDateDeserializer.class)
    @JsonSerialize(using = LocalDateSerializer.class)
    private LocalDate checkTime;

    @ApiModelProperty(value = "被打分寝室Id")
    @TableField("target_dorm")
    private Integer targetDorm;

    @ApiModelProperty(value = "检查人员")
    private String checkUsername;

    @ApiModelProperty(value = "备注")
    private String note;

    @ApiModelProperty(value = "排名")
    private Integer rank;

    @ApiModelProperty(value = "寝室楼")
    private String buildingId;

    @ApiModelProperty(value = "门牌号")
    private String dormId;

    @ApiModelProperty(value = "同期总评分个数")
    private Integer total;

    @TableField(exist = false)
    @ApiModelProperty(value = "平均分")
    private Double avgScore;

    @TableField(exist = false)
    @ApiModelProperty(value = "子检查项详情")
    private List<CheckItemLogVo> itemScores;
}
