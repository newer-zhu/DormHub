package com.zhuhodor.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.config.MybatisRedisCache;
import com.zhuhodor.server.model.pojo.User;
import com.zhuhodor.server.model.vo.condition.UserSearchVo;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2021-07-25
 */
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface UserMapper extends BaseMapper<User> {
    public User getUserByUserName(@Param("username") String username);

    List<User> getAllUsersByCon(@Param("condition") UserSearchVo searchVo);

}
