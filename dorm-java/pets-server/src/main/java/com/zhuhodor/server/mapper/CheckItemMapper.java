package com.zhuhodor.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.config.MybatisRedisCache;
import com.zhuhodor.server.model.pojo.CheckItem;
import org.apache.ibatis.annotations.CacheNamespace;

import java.util.List;

@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface CheckItemMapper extends BaseMapper<CheckItem> {
    List<CheckItem> getAllCheckItems();
}
