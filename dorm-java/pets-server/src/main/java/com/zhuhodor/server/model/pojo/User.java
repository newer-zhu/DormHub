package com.zhuhodor.server.model.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;
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
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author zhuhodor
 * @since 2021-07-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("p_user")
@ApiModel(value="User对象", description="")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @Excel(name = "用户名", width = 15, isImportField = "true_st")
    @ApiModelProperty(value = "用户名")
    @TableField("nick_name")
    private String nickName;

    @Excel(name = "学工号", width = 25, isImportField = "true_st")
    @ApiModelProperty(value = "学工号-唯一")
    private String username;

    @Excel(name = "手机", width = 30, isImportField = "true_st")
    @ApiModelProperty(value = "手机号")
    private String phone;

    @Excel(name = "邮箱", width = 30, isImportField = "true_st")
    @ApiModelProperty(value = "邮箱")
    private String email;

    @Excel(name = "出生日期", databaseFormat = "yyyyMMddHHmmss", format = "yyyy-MM-dd", isImportField = "true_st", width = 30)
    @ApiModelProperty(value = "注册时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "Asia/Shanghai")
    @JsonDeserialize(using = LocalDateDeserializer.class)
    @JsonSerialize(using = LocalDateSerializer.class)
    private LocalDate createDate;

    @Excel(name = "密码", width = 30, isImportField = "true_st")
    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @Excel(name = "学生性别", replace = { "女_0","男_1" }, isImportField = "true_st")
    private Integer sex;

    @Excel(name = "状态", replace = {"启用_true", "停用_false"},width = 30, isImportField = "true_st")
    @ApiModelProperty(value = "状态 停用/启用")
    private Boolean status;

    @TableField("dorm_id")
    @ApiModelProperty(value = "所属寝室")
    private Integer dormId;

    @TableField(exist = false)
    @ApiModelProperty(value = "角色")
    private List<Role> roles;

    @TableField(exist = false)
    @ApiModelProperty(value = "宿舍")
    private Dorm dorm;
}
