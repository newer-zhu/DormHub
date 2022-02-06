package com.zhuhodor.server.service;

import com.zhuhodor.server.model.pojo.Image;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-10
 */
public interface IImageService extends IService<Image> {

    boolean saveImg(Image image);
}
