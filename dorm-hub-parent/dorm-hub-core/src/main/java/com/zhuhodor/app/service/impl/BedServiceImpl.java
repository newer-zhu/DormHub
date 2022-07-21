package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.common.exceptions.ApiException;
import com.zhuhodor.app.mapper.UserMapper;
import com.zhuhodor.app.model.dto.MqTransferDTO;
import com.zhuhodor.app.rabbitmq.producer.PreserveBedProducer;
import com.zhuhodor.app.service.IBedService;
import com.zhuhodor.app.mapper.BedMapper;
import com.zhuhodor.app.mapper.DormMapper;
import com.zhuhodor.app.model.pojo.Bed;
import com.zhuhodor.app.model.pojo.User;
import com.zhuhodor.app.model.vo.BedInfo;
import com.zhuhodor.app.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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
    private UserMapper userMapper;
    @Autowired
    private PreserveBedProducer preserveBedProducer;

    @Override
    @Transactional(rollbackFor = { Exception.class })
    public Result reserve(Integer userId, Integer bedId) {
        //用户已经预约过床位
        if (bedMapper.selectCount(new QueryWrapper<Bed>().eq("user_id", userId)) > 0){
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
                    MqTransferDTO<Bed> transferDTO = new MqTransferDTO<>();
                    transferDTO.setData(bed);
                    transferDTO.setExtraInfo(Map.of("userId", String.valueOf(userId)));
                    preserveBedProducer.sendMsg(transferDTO);
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
            userMapper.update(null, new UpdateWrapper<User>().eq("id", userId).set("dorm_id", -1));
            return true;
        }
        return false;
    }

    @Override
    public List<Bed> getBedsByDormIdFromPc(Integer dormId) {
        return bedMapper.getBedsByDormIdFromPc(dormId);
    }

    @Override
    @Transactional
    public boolean allocateBed(Integer bedId, Integer uid) {
        //被分配用户之前拥有的床位
        List<Bed> beds = bedMapper.selectList(new QueryWrapper<Bed>().eq("user_id", uid));
        if (beds.size() > 1){
            throw new ApiException("用户床位多于1张！");
        }else if (beds.size() == 1){
            Bed cancelBed = beds.get(0);
            //取消用户之前占有的床位
            cancelBed.setUserId(-1);
            cancelBed.setStatus(0);
            bedMapper.updateById(cancelBed);
            dormMapper.occupationIncr(cancelBed.getDormId(), -1);
        }
        //分配床位
        Bed allocatedBed = bedMapper.selectById(bedId);
        //这张床的原有用户处理
        if (allocatedBed.getUserId() != -1){
            dormMapper.occupationIncr(allocatedBed.getDormId(), -1);
            userMapper.update(null, new UpdateWrapper<User>().eq("id", allocatedBed.getUserId()).set("dorm_id", -1));
        }
        allocatedBed.setUserId(uid);
        allocatedBed.setStatus(1);
        if(bedMapper.updateById(allocatedBed) == 1){
            dormMapper.occupationIncr(allocatedBed.getDormId(), 1);
            //更新用户表的寝室信息
            userMapper.update(null, new UpdateWrapper<User>()
                    .eq("id", uid)
                    .set("dorm_id", bedMapper.selectOne(new QueryWrapper<Bed>().eq("id", bedId).select("dorm_id")).getDormId()));
            return true;
        }
        return false;
    }
}
