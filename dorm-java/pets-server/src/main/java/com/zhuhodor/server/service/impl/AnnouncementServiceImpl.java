package com.zhuhodor.server.service.impl;

import com.zhuhodor.server.model.pojo.Announcement;
import com.zhuhodor.server.mapper.AnnouncementMapper;
import com.zhuhodor.server.service.IAnnouncementService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

}
