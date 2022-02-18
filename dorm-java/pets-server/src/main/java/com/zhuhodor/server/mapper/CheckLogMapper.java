package com.zhuhodor.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zhuhodor.server.config.MybatisRedisCache;
import com.zhuhodor.server.model.pojo.CheckLog;
import com.zhuhodor.server.model.vo.CheckLogVo;
import com.zhuhodor.server.model.vo.condition.LogSearchVo;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-20
 */
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface CheckLogMapper extends BaseMapper<CheckLog> {

    CheckLogVo getLogByDormId(@Param("id") Integer id, @Param("time") String time);

    List<CheckLogVo> getLogsByCondition(IPage<CheckLogVo> page, LogSearchVo logSearchVo);
}
