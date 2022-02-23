package com.zhuhodor.server.service;

import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.dto.CheckItemUpdateDTO;
import com.zhuhodor.server.model.pojo.CheckItem;
import com.baomidou.mybatisplus.extension.service.IService;

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
