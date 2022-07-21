package com.zhuhodor.app.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Map;

/**
 * @author: Hodor_Zhu
 * @description mq传输对象
 * @date: 2022/7/21 9:29
 */
@Data
public class MqTransferDTO<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    private String transId;

    private T Data;

    private Map<String, String> extraInfo;
}
