package com.zhuhodor.app.common.domain;

import com.zhuhodor.app.common.exceptions.IErrorCode;
import lombok.Data;

/**
 * 公共返回对象
 */

public class Result<T> {
    private static final long serialVersionUID = 1L;

    private int code;
    private String msg;
    private T data;

    public Result(){
    }
    public Result(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }


    public static <T> Result<T> success(int code, String msg, T data){
        return new Result<T>(code, msg, data);
    }
    public static <T> Result<T> success(String msg){
        return success(ResultCode.SUCCESS.getCode(), msg, null);
    }
    public static <T> Result<T> success(T data){
        return success(ResultCode.SUCCESS.getCode(),ResultCode.SUCCESS.getMessage(),data);
    }
    public static <T> Result<T> success(String msg, T data){
        return success(ResultCode.SUCCESS.getCode(),msg,data);
    }

    public static <T> Result fail(int code, String msg, Object data){
        Result r = new Result<T>();
        r.setMsg(msg);
        r.setCode(code);
        r.setData(data);
        return r;
    }
    public static <T> Result<T> fail(int code, String msg){
        return new Result<T>(code,msg,null);
    }
    public static <T> Result<T> fail(String msg){
        return new Result<T>(ResultCode.FAILED.getCode(),msg,null);
    }
    public static <T> Result<T> fail(IErrorCode errorCode){
        return new Result<T>(errorCode.getCode(), errorCode.getMessage(), null);
    }



    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
