package com.zhuhodor.app.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.zhuhodor.app.model.vo.ImageVo;
import com.zhuhodor.app.model.vo.UserVo;
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
 * @since 2022-01-12
 */
@Getter
@Setter
@TableName("p_announcement")
@ApiModel(value = "Announcement对象", description = "")
public class Announcement implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("title")
    private String title;

    @TableField("content")
    private String content;

    @TableField("publish_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "Asia/Shanghai")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime publishTime;

    @TableField("user_id")
    private Integer userId;

    @TableField("nick_name")
    private String nickName;

    @ApiModelProperty("确认人数")
    @TableField("confirm")
    private Integer confirm;

    @TableField("del_flag")
    private Integer delFlag;

    @ApiModelProperty("删除时间")
    @TableField("del_time")
    private LocalDateTime delTime;

    @TableField(exist = false)
    private UserVo user;

    @TableField(exist = false)
    private List<ImageVo> images;

    @TableField(exist = false)
    private ImageVo cover;

}
