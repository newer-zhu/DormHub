package com.zhuhodor.server.service;

import com.zhuhodor.server.model.pojo.PostComment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.vo.PostCommentVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
public interface IPostCommentService extends IService<PostComment> {
    List<PostCommentVo> getCommentsByPostId(Integer postId);
}
