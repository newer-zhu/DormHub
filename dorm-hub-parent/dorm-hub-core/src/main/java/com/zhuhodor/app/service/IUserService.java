package com.zhuhodor.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.pojo.User;
import com.zhuhodor.app.model.security.MyUserDetails;
import com.zhuhodor.app.model.vo.condition.UserSearchVo;
import org.springframework.web.multipart.MultipartFile;

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

    List<User> getAllUsers(String username);

    boolean updateBatchByUsername(MultipartFile excelFile);
}
