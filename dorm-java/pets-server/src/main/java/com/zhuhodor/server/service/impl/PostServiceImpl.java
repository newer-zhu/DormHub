package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.ImageMapper;
import com.zhuhodor.server.mapper.PostCommentMapper;
import com.zhuhodor.server.mapper.PostMapper;
import com.zhuhodor.server.model.pojo.Image;
import com.zhuhodor.server.model.pojo.Post;
import com.zhuhodor.server.model.vo.PostVo;
import com.zhuhodor.server.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-09-14
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private ImageMapper imageMapper;
    @Autowired
    private PostCommentMapper commentMapper;

    @Override
    @Transactional
    public List<PostVo> getCheckedPosts(Integer lastId, Integer size) {
        List<PostVo> posts = postMapper.getCheckedPosts(lastId, size);
        posts.forEach(i -> {
            i.setImages(imageMapper.selectList(new QueryWrapper<Image>()
                    .eq("post_id", i.getId()).eq("status", 1)));
        });
        return posts;
    }

    @Override
    public boolean deleteById(Integer id) {
        if (postMapper.deleteById(id) == 1){
            imageMapper.update(null, new UpdateWrapper<Image>().eq("post_id", id).set("status", 0));
            return true;
        }
        return false;
    }

    @Override
    public void autoPassAt7Pm() {
        postMapper.autoPassAt7Pm();
    }

    @Transactional
    @Override
    public PostVo getPostById(Integer id) {
        PostVo postVo = postMapper.getPostById(id);
        postVo.setImages(imageMapper.selectList(new QueryWrapper<Image>()
                .eq("post_id", postVo.getId()).eq("status", 1)));
        postVo.setComments(commentMapper.getCommentsByPostId(postVo.getId()));
        return postVo;
    }
}
