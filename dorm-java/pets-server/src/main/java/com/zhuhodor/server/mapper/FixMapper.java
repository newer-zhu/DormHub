package com.zhuhodor.server.mapper;

import com.zhuhodor.server.model.pojo.Fix;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2022-01-01
 */
@Mapper
public interface FixMapper extends BaseMapper<Fix> {

    List<Fix> getFixReportsByUserId(@Param("userId") Integer userId);

    Fix getFixReportById(@Param("id") Integer id);

    List<Fix> getFixReportsByDormId(@Param("dormId") Integer dormId);
}
