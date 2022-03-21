package com.zhuhodor.server.service.impl;

import com.zhuhodor.server.model.dto.UserRole;
import com.zhuhodor.server.mapper.UserRoleMapper;
import com.zhuhodor.server.service.IUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-16
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

}
