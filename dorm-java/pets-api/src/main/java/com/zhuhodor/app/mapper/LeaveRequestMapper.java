package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.LeaveRequest;
import com.zhuhodor.app.model.pojo.User;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-10
 */
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface LeaveRequestMapper extends BaseMapper<LeaveRequest> {
    List<User> getAuditorsByUserId(@Param("userId") Integer userId);

    List<LeaveRequest> getByCondition(Integer id, Integer proposer, Integer auditor);
}
