package com.zhuhodor.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.config.MybatisRedisCache;
import com.zhuhodor.server.model.vo.CheckItemLogVo;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface CheckItemLogVoMapper extends BaseMapper<CheckItemLogVo> {

    Integer saveCheckItemLogs(@Param("checkItemLogs") List<CheckItemLogVo> itemScores);
}
