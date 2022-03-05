package com.zhuhodor.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.model.pojo.ChecklogRank;
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
public interface ChecklogRankMapper extends BaseMapper<ChecklogRank> {
    List<String> getLatestTimes(@Param("item") int num);
}
