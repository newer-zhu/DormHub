package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.PostComment;
import com.zhuhodor.app.model.vo.PostCommentVo;

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
