package com.zhuhodor.server.controller;


import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.Announcement;
import com.zhuhodor.server.service.IAnnouncementService;
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
 * @since 2022-01-12
 */
@RestController
@RequestMapping("/announcement")
public class AnnouncementController {
    @Autowired
    private IAnnouncementService announcementService;

    @ApiOperation(value = "保存公告")
    @PostMapping
    public Result save(@RequestBody Announcement announcement){
        announcement.setPublishTime(LocalDateTime.now());
        if (announcementService.save(announcement)){
            return Result.success("发布成功！");
        }else {
            return Result.fail("发布失败！");
        }
    }

    @ApiOperation(value = "软删除公告")
    @GetMapping("del/soft/{id}")
    public Result softDel(@PathVariable("id") Integer id){
        if (announcementService.softDel(id)){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

    @ApiOperation(value = "硬删除公告")
    @GetMapping("del/hard/{id}")
    public Result hardDel(@PathVariable("id") Integer id){
        if (announcementService.hardDel(id)){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

}
