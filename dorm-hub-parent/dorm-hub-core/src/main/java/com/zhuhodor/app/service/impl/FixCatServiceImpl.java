package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.mapper.FixCatMapper;
import com.zhuhodor.app.model.pojo.FixCat;
import com.zhuhodor.app.model.vo.echarts.FixCatPieVo;
import com.zhuhodor.app.service.IFixCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-06
 */
@Service
public class FixCatServiceImpl extends ServiceImpl<FixCatMapper, FixCat> implements IFixCatService {
    @Autowired
    private FixCatMapper fixCatMapper;

    @Override
    public List<FixCatPieVo> getPie() {
        return fixCatMapper.getPie();
    }
}
