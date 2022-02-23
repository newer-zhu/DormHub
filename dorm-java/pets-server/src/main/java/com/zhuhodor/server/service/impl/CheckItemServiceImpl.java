package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.mapper.CheckItemMapper;
import com.zhuhodor.server.model.dto.CheckItemUpdateDTO;
import com.zhuhodor.server.model.pojo.CheckItem;
import com.zhuhodor.server.service.ICheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CheckItemServiceImpl extends ServiceImpl<CheckItemMapper,CheckItem> implements ICheckItemService {
    @Autowired
    private CheckItemMapper checkItemMapper;
    @Override
    public List<CheckItem> getAllCheckItems() {
        return checkItemMapper.getAllCheckItems();
    }

    @Override
    public List<CheckItem> getEnabledCheckItems() {
        return checkItemMapper.getEnabledCheckItems();
    }

    /**
     * 用版本号解决多人修改导致总分不为100的问题，暂未解决。留坑~
     * @param dto
     * @return
     */
    @Transactional
    @Override
    public Result updateCheckItems(CheckItemUpdateDTO dto) {
        List<CheckItem> allCheckItems = checkItemMapper.getAllCheckItems();
        List<Integer> disabledList = dto.getDisabledList();
        List<CheckItem> newItems = dto.getNewItems();
        int total = 0;
        //新增的item分数累计和
        for (CheckItem item : newItems){
            total += item.getScore();
        }
        //数据库里启用的的item分数累计和
        for (int i = 0; i < allCheckItems.size(); i++) {
            CheckItem parentItems = allCheckItems.get(i);
            for (CheckItem item : parentItems.getChildrenItem()){
                if (!disabledList.contains(item.getId()) && item.getEnabled()){
                    total += item.getScore();
                }
            }
        }
        if (total == 100
                && checkItemMapper.updateDisabled(disabledList) == disabledList.size()
                && checkItemMapper.saveItems(newItems) == newItems.size()){
            return Result.success("更新成功");
        }else {
            return Result.fail("数据在此期间被他人改动，请重试");
        }
    }
}
