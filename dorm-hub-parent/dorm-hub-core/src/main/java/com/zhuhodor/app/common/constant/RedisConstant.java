package com.zhuhodor.app.common.constant;

/**
 * redis中key的常量,为什么用Enum，因为练习用，对枚举不熟悉练练手
 */
public enum RedisConstant {
    //未被审核的帖子set key
    unChecked("unchecked_post"),

    //上次修改检查项的用户键
    checkItemUpdateUser("check_item_update_user"),

    //某期卫生检查排名，与检查日期构成key
    checkRank("check_rank:"),

    //在线用户set
    onlineUsers("online_users"),

    //帖子用户点赞池,与帖子id构成key
    postLikePre("post_like:"),

    //发布的公告Id列表
    announcementList("announcement_list:"),

    //修改CAS
    itemUpdateLock("item_update_lock"),

    //登录用户Log
    loginLog("login_log"),

    //未确认接收的公告，与用户Id构成key，bitmap
    unConfirm("un_confirm:");

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
