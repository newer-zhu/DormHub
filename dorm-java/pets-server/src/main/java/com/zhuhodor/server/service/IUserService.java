package com.zhuhodor.server.service;

import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.security.component.MyUserDetails;

/**
 * <p>
 *  用户服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-07-25
 */
public interface IUserService extends IService<User> {
    Result login(String username, String password);

    MyUserDetails loadUserByUserName(String username);

    Result register(User user);

    Result getUserInfoByToken(String token);
}
