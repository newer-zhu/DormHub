package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.Post;
import com.zhuhodor.app.model.vo.PostVo;
import com.zhuhodor.app.model.vo.condition.PostSearchVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-09-14
 */
public interface IPostService extends IService<Post> {

//    Page<PostVo> getCheckedPosts(Page<PostVo> pageInfo);
    List<PostVo> getCheckedPosts(Integer lastId, Integer size);

    boolean deleteById(Integer id);

    void autoPassAt7Pm();

    PostVo getPostById(Integer id);

    List<PostVo> getUncheckedPosts();

    Boolean checkByBatchIds(List<Integer> ids);

    List<PostVo> getPostsByCon(Page<PostVo> page, PostSearchVo postSearchVo);

    boolean savePost(Post post);
}
