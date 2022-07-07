package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.mapper.DormMapper;
import com.zhuhodor.app.model.pojo.Dorm;
import com.zhuhodor.app.service.IDormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<Dorm> getDormWithStuByBuildingId(String building, int floor) {
        return dormMapper.getDormDetailByBuildingId(building, floor);
    }

    @Override
    public List<String> getBuildingId() {
       return dormMapper.getBuildingId();
    }
}
