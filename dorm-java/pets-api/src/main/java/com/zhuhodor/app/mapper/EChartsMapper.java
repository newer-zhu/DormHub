package com.zhuhodor.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.app.model.pojo.CheckLog;
import com.zhuhodor.app.model.vo.CheckLogVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2022-03-05
 */
@Mapper
public interface EChartsMapper extends BaseMapper<CheckLog> {
    List<String> getLatestTimes(@Param("item") int num);

    List<CheckLogVo> getRankedAvgScores(@Param("item") int num);
}
