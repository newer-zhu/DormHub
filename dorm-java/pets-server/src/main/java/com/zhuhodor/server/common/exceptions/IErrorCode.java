package com.zhuhodor.server.common.exceptions;

/**
 * 封装API的错误码
 */
public interface IErrorCode {
    int getCode();

    String getMessage();
}
