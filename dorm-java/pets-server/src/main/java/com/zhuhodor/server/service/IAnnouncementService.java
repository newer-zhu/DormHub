package com.zhuhodor.server.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.server.model.pojo.Announcement;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-12
 */
public interface IAnnouncementService extends IService<Announcement> {

    boolean softDel(Integer id);

    boolean hardDel(Integer id);

    List<Announcement> getAnnouncements(IPage<Announcement> page);

    boolean saveAnnouncement(Announcement announcement);

    List<Announcement> getFreshAnnouncements();
}
