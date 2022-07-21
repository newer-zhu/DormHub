package com.zhuhodor.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.Image;

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
