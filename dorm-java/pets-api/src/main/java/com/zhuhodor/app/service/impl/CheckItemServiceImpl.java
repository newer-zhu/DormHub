package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.mapper.CheckItemMapper;
import com.zhuhodor.app.model.dto.CheckItemUpdateDTO;
import com.zhuhodor.app.model.pojo.CheckItem;
import com.zhuhodor.app.service.ICheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CheckItemServiceImpl extends ServiceImpl<CheckItemMapper, CheckItem> implements ICheckItemService {
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

    @Transactional
    @Override
    public Result updateCheckItems(CheckItemUpdateDTO dto) {
        List<CheckItem> allCheckItems = checkItemMapper.getAllCheckItems();
        //停用的检查项
        List<Integer> disabledList = dto.getDisabledList();
        //新增的检查项
        List<CheckItem> newItems = dto.getNewItems();
        int total = 0;

        //新增的item分数累计和
        for (CheckItem item : newItems){
            total += item.getScore();
        }
        //数据校验
        for (int i = 0; i < allCheckItems.size(); i++) {
            CheckItem parentItem = allCheckItems.get(i);
            int subTotal = 0;
            for (CheckItem item : parentItem.getChildrenItem()){
                if (!disabledList.contains(item.getId())){
                    subTotal += item.getScore();
                    total += item.getScore();
                }
            }
            if (subTotal != parentItem.getScore()){
                return Result.fail("请保证子检查项与父级分数相等！");
            }
        }
        if (total != 100){
            return Result.fail("请保证总分为100！");
        }

        if (checkItemMapper.updateDisabled(disabledList) == disabledList.size()
                && checkItemMapper.saveItems(newItems) == newItems.size()){
            return Result.success("更新成功");
        }else {
            return Result.fail("更新出错了哦");
        }
    }
}
