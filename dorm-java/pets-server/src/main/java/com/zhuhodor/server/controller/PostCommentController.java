package com.zhuhodor.server.controller;


import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.PostComment;
import com.zhuhodor.server.service.IPostCommentService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
@RestController
@RequestMapping("/post-comment")
public class PostCommentController {
    @Autowired
    private IPostCommentService commentService;

    @ApiOperation(value = "保存评论")
    @PostMapping()
    public Result saveComment(@RequestBody PostComment comment){
        comment.setCreateTime(LocalDateTime.now());
        if (commentService.save(comment)){
            return Result.success("评论成功！");
        }else {
            return Result.fail("评论失败");
        }
    }

    @ApiOperation(value = "删除评论")
    @DeleteMapping("/{id}")
    public Result delComment(@PathVariable("id") Integer id){
        if (commentService.removeById(id)){
            return Result.success("删除成功！");
        }else {
            return Result.fail("删除失败");
        }
    }

    @ApiOperation(value = "根据postId获取评论")
    @GetMapping("/post/{postId}")
    public Result getCommentsByPostId(@PathVariable("postId") Integer postId){
        return Result.success(commentService.getCommentsByPostId(postId));
    }
}
