package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.zhuhodor.server.common.constant.CosConstant;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.common.utils.ImageUtil;
import com.zhuhodor.server.common.utils.TencentCos;
import com.zhuhodor.server.model.pojo.Image;
import com.zhuhodor.server.service.IImageService;
import io.swagger.annotations.ApiOperation;
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
public class ImageController {
    @Autowired
    private TencentCos tencentCos;
    @Autowired
    private IImageService imageService;

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
    @PostMapping("/post/{postId}")
    public Result savePostPic(@PathVariable("postId") Integer postId, @RequestParam("postPic") MultipartFile postPic){
        Map<String, String> map = tencentCos.uploadPic(postPic, CosConstant.POST);
        Image image = ImageUtil.newImage(CosConstant.POST, postId, postPic, map);
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

    @ApiOperation(value = "删除图片")
    @DeleteMapping("/{id}")
    public Result delFixPic(@PathVariable("id") Integer id){
        if (imageService.update(new UpdateWrapper<Image>().eq("id", id).set("status", 0))){
            return Result.success("移除成功");
        }
        return Result.fail("移除出错");
    }

}
