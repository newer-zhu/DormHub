package com.zhuhodor.server.common.constant;

/**
 * redis中key的规定
 * 这里使用enum
 */
public enum RedisConstant {
    //未被审核的帖子set key
    unChecked("unchecked_post"),

    //帖子用户点赞池,与帖子id构成key
    postLikePre("post_like:");

    private final String value;

    //根据字符串返回RedisConstant的枚举类型
    public static RedisConstant getRedisConstant(String constant){
        RedisConstant[] constants = values();
        for (int i = 0; i < constants.length; i++) {
            if (constants[i].getValue().equalsIgnoreCase(constant)){
                return constants[i];
            }
        }
        return null;
    }

    private RedisConstant(String value){
        this.value = value;
    }

    public String getValue(){
        return this.value;
    }
}
