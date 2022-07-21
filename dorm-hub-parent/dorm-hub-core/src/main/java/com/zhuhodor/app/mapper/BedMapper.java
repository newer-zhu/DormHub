package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.Bed;
import com.zhuhodor.app.model.vo.BedInfo;
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
 * @since 2021-10-12
 */
@Mapper
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface BedMapper extends BaseMapper<Bed> {

    BedInfo getBedInfoByUserId(@Param("userId") Integer userId);

    List<Bed> getBedsByDormIdFromPc(@Param("dormId") Integer dormId);
}
