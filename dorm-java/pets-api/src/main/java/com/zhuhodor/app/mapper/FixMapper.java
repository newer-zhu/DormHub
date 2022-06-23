package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.Fix;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface FixMapper extends BaseMapper<Fix> {

    List<Fix> getFixReportsByUserId(@Param("userId") Integer userId);

    Fix getFixReportById(@Param("id") Integer id);

    List<Fix> getFixReportsByDormId(@Param("dormId") Integer dormId);

    List<Fix> getFixReportsByCondition(IPage<Fix> page);
}
