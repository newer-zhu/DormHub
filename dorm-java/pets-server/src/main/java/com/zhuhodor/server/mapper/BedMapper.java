package com.zhuhodor.server.mapper;

import com.zhuhodor.server.model.pojo.Bed;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhuhodor.server.model.vo.BedInfo;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-12
 */
public interface BedMapper extends BaseMapper<Bed> {

    BedInfo getBedInfoByUserId(@Param("userId") Integer userId);
}
