package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zhuhodor.server.mapper.ImageMapper;
import com.zhuhodor.server.model.pojo.Fix;
import com.zhuhodor.server.mapper.FixMapper;
import com.zhuhodor.server.model.pojo.Image;
import com.zhuhodor.server.service.IFixService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
@Service
public class FixServiceImpl extends ServiceImpl<FixMapper, Fix> implements IFixService {
    @Autowired
    private FixMapper fixMapper;
    @Autowired
    private ImageMapper imageMapper;

    @Transactional
    @Override
    public boolean deleteById(Integer id) {
        if (1 == fixMapper.deleteById(id)){
            imageMapper.delete(new QueryWrapper<Image>().eq("fix_id", id));
            return true;
        }
        return false;
    }

    @Override
    public List<Fix> getFixReportsByUserId(Integer userId) {
        return fixMapper.getFixReportsByUserId(userId);
    }

    @Override
    public List<Fix> getFixReportsByDormId(Integer dormId) {
        return fixMapper.getFixReportsByDormId(dormId);
    }

    @Override
    public Fix getFixReportById(Integer id) {
        return fixMapper.getFixReportById(id);
    }

    @Override
    public List<Fix> getFixReportsByCondition(IPage<Fix> page) {
        return fixMapper.getFixReportsByCondition(page);
    }
}
