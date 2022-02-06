package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.mapper.CheckItemMapper;
import com.zhuhodor.server.model.pojo.CheckItem;
import com.zhuhodor.server.service.ICheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckItemServiceImpl extends ServiceImpl<CheckItemMapper,CheckItem> implements ICheckItemService {
    @Autowired
    private CheckItemMapper checkItemMapper;
    @Override
    public List<CheckItem> getAllCheckItems() {
        return checkItemMapper.getAllCheckItems();
    }
}
