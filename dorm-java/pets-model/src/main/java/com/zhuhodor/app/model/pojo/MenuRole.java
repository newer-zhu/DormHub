package com.zhuhodor.app.model.pojo;

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
 * @since 2022-04-30
 */
@Getter
@Setter
@TableName("p_menu_role")
@ApiModel(value = "MenuRole对象", description = "")
public class MenuRole implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    public MenuRole(Integer mid, Integer rid) {
        this.mid = mid;
        this.rid = rid;
    }

    @TableField("mid")
    private Integer mid;

    @TableField("rid")
    private Integer rid;


}
