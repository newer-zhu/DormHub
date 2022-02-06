package com.zhuhodor.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.model.pojo.Post;
import com.zhuhodor.server.model.vo.PostVo;
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
public interface PostMapper extends BaseMapper<Post> {

    List<PostVo> getCheckedPosts(@Param("id") Integer lastId, @Param("size") Integer size);

    void autoPassAt7Pm();

    PostVo getPostById(@Param("id") Integer id);
}
