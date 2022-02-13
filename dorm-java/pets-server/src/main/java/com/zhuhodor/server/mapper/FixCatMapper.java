package com.zhuhodor.server.mapper;

import com.zhuhodor.server.model.pojo.FixCat;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.model.vo.FixCatPieVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-06
 */
@Mapper
public interface FixCatMapper extends BaseMapper<FixCat> {

    List<FixCatPieVo> getPie();
}
