package com.zhuhodor.server.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhuhodor.server.common.constant.RedisConstant;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.common.utils.RedisUtil;
import com.zhuhodor.server.model.pojo.Post;
import com.zhuhodor.server.model.vo.PostVo;
import com.zhuhodor.server.model.vo.condition.PostSearchVo;
import com.zhuhodor.server.rabbitMq.producer.DelayMessageProducer;
import com.zhuhodor.server.service.IPostService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-09-14
 */
@Slf4j
@RestController
@RequestMapping("/post")
public class PostController {
    @Autowired
    private IPostService postService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private DelayMessageProducer messageProducer;

    @ApiOperation(value = "获取帖子信息")
    @GetMapping("/{id}")
    public Result getPost(@PathVariable Integer id){
        return Result.success(postService.getPostById(id));
    }

    @ApiOperation(value = "根据条件获取所有帖子")
    @PostMapping("/con/{cur}")
    public Result getPostsByCon(@RequestBody PostSearchVo postSearchVo, @PathVariable("cur") Integer cur){
        Page<PostVo> page = new Page<>(cur, 8);
        List<PostVo> list = postService.getPostsByCon(page, postSearchVo);
        page.setRecords(list);
        return Result.success(page);
    }

    @ApiOperation(value = "保存帖子")
    @PostMapping("/save")
    public Result savePost(@RequestBody Post post){
        post.setTime(LocalDateTime.now());
        messageProducer.sendMsg(post.toString());
        return null;
//        if(post.getId() == null && postService.save(post)){
//            return Result.success("提交成功!",post);
//        }else if (post.getId() != null && postService.updateById(post)){
//            return Result.success("更新成功!", post);
//        }else {
//            return Result.fail("提交出错了!");
//        }
    }

    @ApiOperation(value = "删除帖子")
    @DeleteMapping("/{id}")
    public Result delPost(@PathVariable("id") Integer id){
        //TODO 删除前验证
        if(postService.deleteById(id)){
            redisUtil.srem(RedisConstant.unChecked.getValue(), id);
            redisUtil.del(RedisConstant.postLikePre.getValue() + id);
            return Result.success("删除成功!");
        }
        return Result.fail("删除失败");
    }

    @ApiOperation(value = "点赞动作")
    @GetMapping("/like/{isLike}")
    public Result likePost(@PathVariable("isLike") Boolean isLike,
                           @RequestParam("postId") Integer postId, @RequestParam("uId") Integer uId){
        if (isLike){//点赞
            redisUtil.sadd(RedisConstant.postLikePre.getValue() + postId, String.valueOf(uId));
            return Result.success("点赞成功");
        }else {//取消赞
            redisUtil.srem(RedisConstant.postLikePre.getValue() + postId, uId);
            return Result.success("已取消赞");
        }
    }

    @ApiOperation(value = "获取未审核的帖子")
    @GetMapping("/audit/unchecked")
    public Result getUncheckedPost(){
        List<PostVo> posts = postService.getUncheckedPosts();
        return Result.success(posts);
    }

    @ApiOperation(value = "获取通过审核的帖子")
    @GetMapping("/checked")
    public Result getCheckedPost(@RequestParam("lastId") Integer lastId, @RequestParam("userId") Integer uId){
        int size = 5;//每次刷新获取的条数
        List<PostVo> posts = postService.getCheckedPosts(lastId, size);
        HashMap<String, Object> map = new HashMap<>();
        ArrayList<Integer> likedList = new ArrayList<>();
        for (PostVo p : posts){
            String redisKey = RedisConstant.postLikePre.getValue() + p.getId();
            //查看用户是否在点赞池里
            if (redisUtil.sisSetMem(redisKey, String.valueOf(uId))){
                likedList.add(p.getId());
            }
            //设置点赞数
            long tempLikes = redisUtil.sSize(redisKey);
            //只要redis没挂，里面的数据一定是最新的
            p.setLikeNum(Math.toIntExact(tempLikes));
        }
        if (posts.size() < size){
            map.put("isEnd", true);
        }else {
            map.put("isEnd", false);
        }
        map.put("posts", posts);
        map.put("likedList", likedList);
        return Result.success(map);
    }

    @ApiOperation(value = "审核通过")
    @GetMapping("/audit/check/{id}")
    public Result checkPost(@PathVariable("id") String id){
        if (postService.update(new UpdateWrapper<Post>()
                .eq("id", id)
                .set("status", 1))){
            return Result.success("已通过");
        }
        return Result.fail("操作失败");
    }

    @ApiOperation(value = "审核批量通过")
    @PostMapping("/audit/check/batch")
    public Result checkPosts(@RequestBody List<Integer> ids){
        if (postService.checkByBatchIds(ids)){
            return Result.success("操作成功");
        }
        return Result.fail("处理失败！");
    }

    @ApiOperation(value = "审核不通过")
    @GetMapping("/audit/fail/{id}")
    public Result failPost(@PathVariable("id") String id){
        if (postService.update(new UpdateWrapper<Post>()
                .eq("id", id)
                .set("status", -1))){
            return Result.success("已审核");
        }
        return Result.fail("操作失败");
    }

    @ApiOperation(value = "获取用户所有帖子")
    @GetMapping()
    public Result getPostsByUserId(@RequestParam("userId") Integer userId){
        List<Post> posts = postService.list(new QueryWrapper<Post>()
                .eq("user_id", userId)
                .select("id,title,content,time,status").orderByDesc("time"));
        ArrayList<Post> checked = new ArrayList<>();
        ArrayList<Post> unchecked = new ArrayList<>();
        ArrayList<Post> failed = new ArrayList<>();
        for (Post p : posts){
            if (p.getStatus() == 1){
                checked.add(p);
            }else if (p.getStatus() == -1){
                failed.add(p);
            }else {
                unchecked.add(p);
            }
        }
        return Result.success(MapUtil.builder()
                .put("checked", checked)
                .put("unchecked", unchecked)
                .put("failed", failed).map());
    }

}
