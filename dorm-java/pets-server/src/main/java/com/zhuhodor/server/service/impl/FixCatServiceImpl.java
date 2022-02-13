package com.zhuhodor.server.service.impl;

import com.zhuhodor.server.model.pojo.FixCat;
import com.zhuhodor.server.mapper.FixCatMapper;
import com.zhuhodor.server.model.vo.FixCatPieVo;
import com.zhuhodor.server.service.IFixCatService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
