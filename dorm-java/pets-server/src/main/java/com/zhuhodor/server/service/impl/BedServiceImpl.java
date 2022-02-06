package com.zhuhodor.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.mapper.BedMapper;
import com.zhuhodor.server.mapper.DormMapper;
import com.zhuhodor.server.model.pojo.Bed;
import com.zhuhodor.server.model.pojo.User;
import com.zhuhodor.server.model.vo.BedInfo;
import com.zhuhodor.server.service.IBedService;
import com.zhuhodor.server.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-12
 */
@Service
public class BedServiceImpl extends ServiceImpl<BedMapper, Bed> implements IBedService {
    @Autowired
    private BedMapper bedMapper;
    @Autowired
    private DormMapper dormMapper;
    @Autowired
    private IUserService userService;

    @Override
    @Transactional(rollbackFor = { Exception.class })
    public Result reserve(Integer userId, Integer bedId) {
        //用户已经预约过床位
        if (bedMapper.selectList(new QueryWrapper<Bed>().eq("user_id", userId)).size() > 0){
            return Result.fail("请勿重复预约!");
        }else{
            Bed bed = bedMapper.selectById(bedId);
            //所选床位已被预约
            if (bed.getStatus() == 1) {
                return Result.fail("此床位已被预约!");
            }else {
                bed.setStatus(1);
                bed.setUserId(userId);
                if (1 == bedMapper.updateById(bed)){
                    dormMapper.occupationIncr(bed.getDormId(), 1);
                    //更新用户表的寝室信息
                    userService.update(new UpdateWrapper<User>()
                            .eq("id", userId)
                            .set("dorm_id", bedMapper.selectOne(new QueryWrapper<Bed>().eq("id", bedId).select("dorm_id")).getDormId()));
                    return Result.success("预约成功!");
                }
            }
        }
        return Result.fail("预约失败");
    }

    @Override
    public BedInfo getBedInfoByUserId(Integer userId) {
        return bedMapper.getBedInfoByUserId(userId);
    }

    @Override
    @Transactional(rollbackFor = { Exception.class })
    public boolean cancel(Integer userId, Integer bedId) {
        Bed bed = bedMapper.selectById(bedId);
        bed.setUserId(-1);
        bed.setStatus(0);
        if (1 == bedMapper.updateById(bed)){
            dormMapper.occupationIncr(bed.getDormId(), -1);
            userService.update(new UpdateWrapper<User>().eq("id", userId).set("dorm_id", -1));
            return true;
        }
        return false;
    }
}
