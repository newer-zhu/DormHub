package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.Dorm;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-12
 */
@Mapper
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface DormMapper extends BaseMapper<Dorm> {

    Dorm getDormById(@Param("id") Integer id);

    Integer occupationIncr(@Param("dormId") Integer dormId, @Param("incr") Integer incr);

    List<Dorm> getDormDetailByBuildingId(@Param("id") String building,@Param("floor") int floor);


    List<String> getBuildingId();
}
