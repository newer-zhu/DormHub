package com.zhuhodor.server.model.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.zhuhodor.server.model.pojo.Image;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="PostVo对象", description="")
public class PostVo {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "帖子Id")
    private Integer id;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "审核不通过原因")
    private String reason;

    @ApiModelProperty(value = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "Asia/Shanghai")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime time;

    @ApiModelProperty(value = "发布者")
    private Integer userId;

    @ApiModelProperty(value = "发布者头像")
    private String avatar;

    @ApiModelProperty(value = "状态")
    private Integer status;

    @ApiModelProperty(value = "点赞数")
    @TableField("like_num")
    private Integer likeNum;

    @ApiModelProperty(value = "图片")
    private List<Image> images;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "楼号")
    private String buildingId;

    @ApiModelProperty(value = "评论")
    private List<PostCommentVo> comments;
}
