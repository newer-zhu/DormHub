package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.model.dto.CheckItemUpdateDTO;
import com.zhuhodor.app.model.pojo.CheckItem;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-19
 */
public interface ICheckItemService extends IService<CheckItem> {
    List<CheckItem> getAllCheckItems();

    List<CheckItem> getEnabledCheckItems();

    Result updateCheckItems(CheckItemUpdateDTO dto);
}
