package com.zhuhodor.server.service.impl;

import com.zhuhodor.server.model.pojo.PostComment;
import com.zhuhodor.server.mapper.PostCommentMapper;
import com.zhuhodor.server.model.vo.PostCommentVo;
import com.zhuhodor.server.service.IPostCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
@Service
public class PostCommentServiceImpl extends ServiceImpl<PostCommentMapper, PostComment> implements IPostCommentService {
    @Autowired
    private PostCommentMapper commentMapper;

    @Override
    public List<PostCommentVo> getCommentsByPostId(Integer postId) {
        return commentMapper.getCommentsByPostId(postId);
    }
}
