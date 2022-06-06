package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.Menu;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-28
 */
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> getMenusWithRole();

    List<Menu> getMenusByUserId(@Param("userId") Integer userId);

    List<Menu> getMenus();

    List<Menu> getMenusByRoleId(@Param("roleId") Integer roleId);
}
