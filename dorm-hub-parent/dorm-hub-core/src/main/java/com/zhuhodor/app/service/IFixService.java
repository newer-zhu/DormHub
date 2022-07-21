package com.zhuhodor.app.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.Fix;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
public interface IFixService extends IService<Fix> {

    boolean deleteById(Integer id);

    List<Fix> getFixReportsByUserId(Integer userId);

    List<Fix> getFixReportsByDormId(Integer dormId);

    Fix getFixReportById(Integer id);

    List<Fix> getFixReportsByCondition(IPage<Fix> page);
}
