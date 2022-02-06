package com.zhuhodor.server.common.utils;

import cn.hutool.core.io.FileTypeUtil;
import com.zhuhodor.server.model.pojo.Image;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.Map;

@Slf4j
public class ImageUtil {

    public static Image newImage(String type, Integer id, MultipartFile file, Map<String, String> map){
        Image image = new Image();
        image.setCreateTime(LocalDateTime.now());
        image.setSize((double) (file.getSize() /( 1024 * 1024)));
        image.setUrl(map.get("remoteAddr") + map.get("key"));
        image.setIkey(map.get("key"));
        image.setStatus(1);
        try {
            image.setSuffix(FileTypeUtil.getType(file.getInputStream()));
        } catch (Exception e) {
            log.error("获取图片实例出错！");
            e.printStackTrace();
        }
        switch (type){
            case "request/":
                image.setRequestId(id);
                break;
            case "post/":
                image.setPostId(id);
                break;
            case "fix/":
                image.setFixId(id);
                break;
        }
        return image;
    }
}
