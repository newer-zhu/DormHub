package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhuhodor.app.config.MybatisRedisCache;
import com.zhuhodor.app.model.pojo.Post;
import com.zhuhodor.app.model.vo.PostVo;
import com.zhuhodor.app.model.vo.condition.PostSearchVo;
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
 * @since 2021-09-14
 */
@Mapper
@CacheNamespace(implementation= MybatisRedisCache.class,eviction=MybatisRedisCache.class)
public interface PostMapper extends BaseMapper<Post> {

    List<PostVo> getCheckedPosts(@Param("id") Integer lastId, @Param("size") Integer size);

    void autoPassAt7Pm();

    PostVo getPostById(@Param("id") Integer id);

    List<PostVo> getUncheckedPosts();

    Integer checkByBatchIds(@Param("ids") List<Integer> ids);

    List<PostVo> getPostsByCon(Page<PostVo> page, PostSearchVo postSearchVo);
}
