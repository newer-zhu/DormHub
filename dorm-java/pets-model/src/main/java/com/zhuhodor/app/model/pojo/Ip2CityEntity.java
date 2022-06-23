package com.zhuhodor.app.model.pojo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class Ip2CityEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * IP地址
     */
    private String ip;

    /**
     * 国家名称
     */
    private String country;

    /**
     * 省份名称
     */
    private String province;

    /**
     * 城市名称
     */
    private String city;

    /**
     * 经度
     */
    private Double longitude;

    /**
     * 维度
     */
    private Double latitude;

    /**
     * 查询耗时
     */
    private String cost;
}
