package com.zhuhodor.app.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.zhuhodor.app.common.constant.CosConstant;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.utils.ImageUtil;
import com.zhuhodor.app.common.utils.TencentCos;
import com.zhuhodor.app.model.pojo.Image;
import com.zhuhodor.app.model.pojo.User;
import com.zhuhodor.app.model.vo.ImageVo;
import com.zhuhodor.app.service.IImageService;
import com.zhuhodor.app.service.IUserService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-10
 */
@RestController
@RequestMapping("/image")
@Slf4j
public class ImageController {
    @Autowired
    private TencentCos tencentCos;
    @Autowired
    private IImageService imageService;
    @Autowired
    private IUserService userService;

    @ApiOperation(value = "保存报修图片")
    @PostMapping("/fix/{fixId}")
    public Result saveFixPic(@PathVariable("fixId") Integer fixId, @RequestParam("fixPic") MultipartFile fixPic){
        Map<String, String> map = tencentCos.uploadPic(fixPic, CosConstant.FIX);
        Image image = ImageUtil.newImage(CosConstant.FIX, fixId, fixPic, map);
        if (imageService.save(image)){
            map.put("imageId", String.valueOf(image.getId()));
            return Result.success("上传成功",map);
        }else {
            Result.fail("上传出错");
        }
        return null;
    }

    @ApiOperation(value = "保存帖子图片")
    @PostMapping("/post")
    public Result savePostPic(@RequestParam("postPic") MultipartFile postPic){
        Map<String, String> map = tencentCos.uploadPic(postPic, CosConstant.POST);
        Image image = ImageUtil.newImage(CosConstant.POST,-1, postPic, map);
        if (imageService.save(image)){
            map.put("imageId", String.valueOf(image.getId()));
            return Result.success("上传成功",map);
        }else {
            Result.fail("上传出错");
        }
        return null;
    }

    @ApiOperation(value = "保存请假图片")
    @PostMapping("/leave/{requestId}")
    public Result uploadFile(@RequestParam("reqFile") MultipartFile file, @PathVariable("requestId") Integer requestId){
        Map<String, String> map = tencentCos.uploadPic(file, CosConstant.REQUEST);
        Image image = ImageUtil.newImage(CosConstant.REQUEST, requestId, file, map);
        if (imageService.save(image)){
            map.put("imageId", String.valueOf(image.getId()));
            return Result.success(map);
        }else {
            return Result.fail("上传出错!");
        }
    }

    @ApiOperation(value = "用户头像上传")
    @PostMapping("/avatar")
    public Result uploadAvatar(@RequestParam("avatar") MultipartFile avatar){
        return Result.success("上传成功",tencentCos.uploadPic(avatar, CosConstant.AVATAR));
    }

    @ApiOperation(value = "用户头像更新")
    @PostMapping(value = "/avatarUpdate/{userId}")
    public Result UpdateAvatar(@RequestParam("avatar") MultipartFile avatar, @PathVariable("userId") Integer userId){
        Map<String, String> map = tencentCos.uploadPic(avatar, CosConstant.AVATAR);
        String url = map.get("remoteAddr") + map.get("key");
        userService.update(null, new UpdateWrapper<User>().eq("id", userId).set("avatar", url));
        return Result.success(url);
    }

    @ApiOperation(value = "公告图片上传")
    @PostMapping("/announcement")
    public Result uploadAnnouncementPic(@RequestParam("img") MultipartFile pic){
        Map<String, String> map = tencentCos.uploadPic(pic, CosConstant.ANNOUNCEMENT);
        String url = map.get("remoteAddr") + map.get("key");
        Image image = ImageUtil.newImage(CosConstant.ANNOUNCEMENT, -1, pic, map);
        imageService.save(image);

        return Result.success("上传成功", new ImageVo(image.getId(), url));
    }

    @ApiOperation(value = "删除图片")
    @DeleteMapping("/{id}")
    public Result delFixPic(@PathVariable("id") Integer id){
        if (imageService.update(new UpdateWrapper<Image>().eq("id", id).set("status", 0))){
            return Result.success("移除成功");
        }
        return Result.fail("移除出错");
    }

}
