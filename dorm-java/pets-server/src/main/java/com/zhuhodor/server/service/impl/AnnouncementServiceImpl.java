package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.AnnouncementMapper;
import com.zhuhodor.server.mapper.ImageMapper;
import com.zhuhodor.server.model.pojo.Announcement;
import com.zhuhodor.server.model.pojo.Image;
import com.zhuhodor.server.model.vo.ImageVo;
import com.zhuhodor.server.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

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

    @Autowired
    private ImageMapper imageMapper;

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

    @Override
    public List<Announcement> getAnnouncements(IPage<Announcement> page) {
        return announcementMapper.getAnnouncements(page);
    }

    @Transactional
    @Override
    public boolean saveAnnouncement(Announcement announcement) {
        announcement.setPublishTime(LocalDateTime.now());
        if (announcementMapper.insert(announcement) == 1){
            List<ImageVo> images = announcement.getImages();
            images.forEach(f -> {
                imageMapper.update(null, new UpdateWrapper<Image>()
                        .eq("id", f.getId()).set("status", 1).set("announce_id", announcement.getId()));
            });
            return true;
        }
        return false;
    }

    @Override
    public List<Announcement> getFreshAnnouncements() {
        List<Announcement> records = announcementMapper.selectPage(new Page<Announcement>(1, 3),
                new QueryWrapper<Announcement>()
                .select("id", "title", "publish_time", "nick_name").eq("del_flag", 0)
                .orderByDesc("publish_time")).getRecords();

        //设置封面
        records.forEach(f -> {
            List<Image> image = imageMapper.selectPage(new Page<Image>(1, 1),
                    new QueryWrapper<Image>().eq("announce_id", f.getId())).getRecords();
            if (image.size() > 0){
                f.setCover(new ImageVo(null, image.get(0).getUrl()));
            }
        });
        return records;
    }
}
