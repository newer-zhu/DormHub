package com.zhuhodor.server.service.impl;

import com.zhuhodor.server.model.pojo.Dorm;
import com.zhuhodor.server.mapper.DormMapper;
import com.zhuhodor.server.service.IDormService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-12
 */
@Service
public class DormServiceImpl extends ServiceImpl<DormMapper, Dorm> implements IDormService {
    @Autowired
    private DormMapper dormMapper;

    @Override
    public Dorm getDormById(Integer id) {
        return dormMapper.getDormById(id);
    }
}
