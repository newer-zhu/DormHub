package com.zhuhodor.server.mapper;

import com.zhuhodor.server.model.pojo.PostComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.model.vo.PostCommentVo;
import org.apache.ibatis.annotations.Mapper;
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
@Mapper
public interface PostCommentMapper extends BaseMapper<PostComment> {

    List<PostCommentVo> getCommentsByPostId(@Param("postId") Integer id);
}
