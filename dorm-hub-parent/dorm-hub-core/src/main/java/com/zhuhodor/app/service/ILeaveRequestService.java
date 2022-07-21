package com.zhuhodor.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zhuhodor.app.model.pojo.LeaveRequest;
import com.zhuhodor.app.model.pojo.User;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-10
 */
public interface ILeaveRequestService extends IService<LeaveRequest> {
    List<User> getAuditorsByUserId(Integer userId);

    List<LeaveRequest> getByCondition(Integer id, Integer proposer, Integer auditor);

    boolean deleteById(Integer id);
}
