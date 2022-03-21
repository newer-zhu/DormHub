package com.zhuhodor.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.User;
import com.zhuhodor.server.model.vo.condition.UserSearchVo;
import com.zhuhodor.server.security.component.MyUserDetails;

import java.util.List;

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

    List<User> getAllUsersByCon(UserSearchVo searchVo);

    Boolean assignRoleToUser(List<Integer> roleList, Integer userId);

    List<User> getAllUsers();
}
