package com.zhuhodor.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.FixCat;
import com.zhuhodor.app.model.vo.echarts.FixCatPieVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-06
 */
public interface IFixCatService extends IService<FixCat> {

    List<FixCatPieVo> getPie();
}
