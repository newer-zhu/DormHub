package com.zhuhodor.server.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.zhuhodor.server.model.vo.DormVo;
import com.zhuhodor.server.model.vo.ImageVo;
import com.zhuhodor.server.model.vo.UserVo;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
@Getter
@Setter
@TableName("p_fix")
@ApiModel(value = "Fix对象", description = "")
public class Fix implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("主体")
    private String thing;

    @ApiModelProperty("数量")
    private Integer num;

    @ApiModelProperty("报修细节")
    @TableField("detail")
    private String detail;

    @ApiModelProperty("分类id")
    @TableField("cat_id")
    private Integer catId;

    @ApiModelProperty("报修寝室id")
    @TableField("dorm_id")
    private Integer dormId;

    @ApiModelProperty("报修寝室")
    @TableField(exist = false)
    private DormVo dorm;

    @TableField("create_time")
    @ApiModelProperty(value = "报修时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "Asia/Shanghai")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime createTime;

    @TableField("expect_time")
    @ApiModelProperty(value = "维修时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "Asia/Shanghai")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime expectTime;

    @ApiModelProperty("报修人")
    @TableField("user_id")
    private Integer userId;

    @ApiModelProperty("-1已被删除 0未处理 1已解决")
    @TableField("status")
    private Integer status;

    @ApiModelProperty("联系电话")
    @TableField("phone")
    private String phone;

    @ApiModelProperty("优先级 0 1 2 3依次降序")
    @TableField("priority")
    private Integer priority;

    @ApiModelProperty("图片")
    @TableField(exist = false)
    private List<ImageVo> images;

    @ApiModelProperty("分类")
    @TableField(exist = false)
    private FixCat cat;

    @ApiModelProperty("用户信息")
    @TableField(exist = false)
    private UserVo user;
}
