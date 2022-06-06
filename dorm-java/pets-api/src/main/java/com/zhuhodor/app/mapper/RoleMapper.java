package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.Role;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-17
 */
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface RoleMapper extends BaseMapper<Role> {

    Integer releaseMenusByRoleId(@Param("roleId") Integer id);

    Integer acquireMenusWithRoleId(List<Integer> menuList, Integer id);
}
