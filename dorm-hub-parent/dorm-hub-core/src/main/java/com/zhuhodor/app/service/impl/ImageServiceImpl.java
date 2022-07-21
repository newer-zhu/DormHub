package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.service.IImageService;
import com.zhuhodor.app.mapper.ImageMapper;
import com.zhuhodor.app.model.pojo.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-10
 */
@Service
public class ImageServiceImpl extends ServiceImpl<ImageMapper, Image> implements IImageService {

    @Autowired
    private ImageMapper imageMapper;

    @Override
    public boolean saveImg(Image image) {
        int i = imageMapper.insert(image);
        return i == 1;
    }
}
