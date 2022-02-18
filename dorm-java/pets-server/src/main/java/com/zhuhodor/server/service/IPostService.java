package com.zhuhodor.server.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.pojo.Post;
import com.zhuhodor.server.model.vo.PostVo;

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
}
