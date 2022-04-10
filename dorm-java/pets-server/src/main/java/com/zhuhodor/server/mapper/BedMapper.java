package com.zhuhodor.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.config.MybatisRedisCache;
import com.zhuhodor.server.model.pojo.Bed;
import com.zhuhodor.server.model.vo.BedInfo;
import org.apache.ibatis.annotations.CacheNamespace;
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
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface BedMapper extends BaseMapper<Bed> {

    BedInfo getBedInfoByUserId(@Param("userId") Integer userId);

    List<Bed> getBedsByDormIdFromPc(@Param("dormId") Integer dormId);
}
