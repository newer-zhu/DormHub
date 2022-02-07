package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.AnnouncementMapper;
import com.zhuhodor.server.model.pojo.Announcement;
import com.zhuhodor.server.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-12
 */
@Service
public class AnnouncementServiceImpl extends ServiceImpl<AnnouncementMapper, Announcement> implements IAnnouncementService {
    @Autowired
    private AnnouncementMapper announcementMapper;
//
//    @Autowired
//    private ImageMapper imageMapper;

    @Transactional
    @Override
    public boolean softDel(Integer id) {
        return announcementMapper.update(null,new UpdateWrapper<Announcement>()
                .set("del_flag", 1)
                .set("del_time", LocalDateTime.now())) == 1;
    }

    @Transactional
    @Override
    public boolean hardDel(Integer id) {
        return 1 == announcementMapper.deleteById(id);
    }
}
