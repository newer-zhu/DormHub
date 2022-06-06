package com.zhuhodor.app.model.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-16
 */
@Getter
@Setter
@TableName("p_user_role")
@ApiModel(value = "UserRole对象", description = "")
public class UserRole implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    public UserRole(Integer uId, Integer rId) {
        this.uId = uId;
        this.rId = rId;
    }

    @TableField("u_id")
    private Integer uId;

    @TableField("r_id")
    private Integer rId;


}
