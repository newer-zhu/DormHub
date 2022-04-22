package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhuhodor.server.common.constant.RedisConstant;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.common.utils.RedisUtil;
import com.zhuhodor.server.model.pojo.Announcement;
import com.zhuhodor.server.security.component.MyUserDetails;
import com.zhuhodor.server.service.IAnnouncementService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-12
 */
@RestController
@RequestMapping("/announcement")
public class AnnouncementController {
    @Autowired
    private IAnnouncementService announcementService;
    @Autowired
    private RedisUtil redisUtil;

    @ApiOperation(value = "获取公告")
    @GetMapping("/{id}")
    public Result save(@PathVariable("id") Integer id){
        return Result.success(announcementService.getById(id));
    }

    @ApiOperation(value = "保存公告")
    @PostMapping("/admin/save")
    public Result save(@RequestBody Announcement announcement, Authentication authentication){
        MyUserDetails userDetails = (MyUserDetails) authentication.getPrincipal();
        announcement.setUserId(userDetails.getUser().getId());
        announcement.setNickName(userDetails.getUser().getNickName());
        if (announcementService.saveAnnouncement(announcement)){
            //放进队列
            redisUtil.rpush(RedisConstant.announcementList.getValue(), String.valueOf(announcement.getId()));
            return Result.success("发布成功！");
        }else {
            return Result.fail("发布失败！");
        }
    }

    @ApiOperation(value = "修改公告")
    @PostMapping("/admin/update")
    public Result update(@RequestBody Announcement announcement){
        announcement.setPublishTime(LocalDateTime.now());
        if (announcementService.updateById(announcement)){
            return Result.success("修改成功！");
        }else {
            return Result.fail("修改失败！");
        }
    }

    @ApiOperation(value = "撤回公告")
    @GetMapping("/admin/withdrew/{id}")
    public Result withdrew(@PathVariable("id") Integer id){
        if (announcementService.update(new UpdateWrapper<Announcement>()
                .eq("id", id).set("del_flag", 1))){
            return Result.success("撤回成功！");
        }
        return Result.fail("撤回失败！");
    }

    @ApiOperation( value = "取消撤回公告")
    @GetMapping("/admin/withdrew/dis/{id}")
    public Result disWithdrew(@PathVariable("id") Integer id){
        if (announcementService.update(new UpdateWrapper<Announcement>()
                .eq("id", id).set("del_flag", 0))){
            return Result.success("取消成功！");
        }
        return Result.fail("取消失败！");
    }

    @ApiOperation(value = "硬删除公告")
    @GetMapping("/admin/del/hard/{id}")
    public Result hardDel(@PathVariable("id") Integer id){
        if (announcementService.hardDel(id)){
            redisUtil.lrem(RedisConstant.announcementList.getValue(), id, 1);
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

    @ApiOperation(value = "获取所有公告")
    @GetMapping("/list")
    public Result getByCondition(@RequestParam("cur") Integer cur){
        IPage<Announcement> page = new Page<>(cur, 7);
        List<Announcement> list = announcementService.getAnnouncements(page);
        page.setRecords(list);
        return Result.success(page);
    }

    @ApiOperation(value = "获取最新三条公告")
    @GetMapping("/fresh")
    public Result getFreshAnnouncements(){
        List<Announcement> list = announcementService.getFreshAnnouncements();
        return Result.success(list);
    }

    @ApiOperation(value = "获取用户未读公告")
    @GetMapping("/unConfirm/{userId}")
    public Result getUnConfirmAnnouncements(@PathVariable("userId") Integer userId){
        List<String> allAnnoId = redisUtil.lrange(RedisConstant.announcementList.getValue(), 0, -1);
        String key = RedisConstant.unConfirm.getValue() + userId;
        ArrayList<Integer> unConfirm = new ArrayList<>();
        for (String id : allAnnoId){
            if (redisUtil.hasKey(key)){
                if (!redisUtil.getBit(key, Long.valueOf(id))){
                    unConfirm.add(Integer.valueOf(id));
                }
            }else {
                redisUtil.setBit(key, 0, false);
            }
        }
        return Result.success(announcementService.listByIds(unConfirm));
    }

    @ApiOperation(value = "确认公告")
    @GetMapping("/confirm/{annoId}")
    public Result confirmAnnouncementByUserId(@PathVariable("annoId") Integer annoId, Authentication authentication){
        MyUserDetails userDetails = (MyUserDetails) authentication.getPrincipal();
        String key = RedisConstant.unConfirm.getValue() + userDetails.getUser().getId();
        if (redisUtil.getBit(key, annoId)){
            return Result.success("你已经确认过");
        }else {
            redisUtil.setBit(key, annoId, true);
            return Result.success("确认收到成功");
        }
    }

}
