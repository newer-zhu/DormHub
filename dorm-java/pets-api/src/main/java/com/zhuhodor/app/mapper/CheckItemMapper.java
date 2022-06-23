package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.CheckItem;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface CheckItemMapper extends BaseMapper<CheckItem> {
    List<CheckItem> getAllCheckItems();

    List<CheckItem> getEnabledCheckItems();

    Integer updateDisabled(@Param("disabledList") List<Integer> disabledList);

    Integer saveItems(@Param("newItems") List<CheckItem> newItems);

}
