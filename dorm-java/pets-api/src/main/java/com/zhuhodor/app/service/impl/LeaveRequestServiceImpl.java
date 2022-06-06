package com.zhuhodor.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.mapper.ImageMapper;
import com.zhuhodor.app.mapper.LeaveRequestMapper;
import com.zhuhodor.app.model.pojo.LeaveRequest;
import com.zhuhodor.app.service.ILeaveRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-10
 */
@Service
public class LeaveRequestServiceImpl extends ServiceImpl<LeaveRequestMapper, LeaveRequest> implements ILeaveRequestService {
    @Autowired
    private LeaveRequestMapper leaveRequestMapper;
    @Autowired
    private ImageMapper imageMapper;

    public List<User> getAuditorsByUserId(Integer userId) {
        return leaveRequestMapper.getAuditorsByUserId(userId);
    }

    @Override
    public List<LeaveRequest> getByCondition(Integer id, Integer proposer, Integer auditor) {
        return leaveRequestMapper.getByCondition(id, proposer, auditor);
    }

    @Override
    public boolean deleteById(Integer id) {
        if (leaveRequestMapper.deleteById(id) == 1){
            imageMapper.update(null, new UpdateWrapper<Image>().eq("request_id", id).set("status", 0));
            return true;
        }
        return false;
    }
}
