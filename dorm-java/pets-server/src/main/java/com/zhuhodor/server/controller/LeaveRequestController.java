package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.LeaveRequest;
import com.zhuhodor.server.security.component.MyUserDetails;
import com.zhuhodor.server.service.ILeaveRequestService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-10-10
 */
@RestController
@RequestMapping("/leave-request")
public class LeaveRequestController {
    @Autowired
    private ILeaveRequestService leaveRequestService;

    @ApiOperation(value = "获取详细请假条信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "请假条Id", required = false),
            @ApiImplicitParam(name = "proposer", value = "请假人Id", required = false),
            @ApiImplicitParam(name = "auditor", value = "审批人Id", required = false)
    })
    @GetMapping()
    public Result getRequestDetail(@RequestParam(name = "id", required = false, defaultValue = "-1") Integer id,
                                   @RequestParam(name = "proposer", required = false, defaultValue = "-1") Integer proposer,
                                   @RequestParam(name="auditor", required = false, defaultValue = "-1") Integer auditor){
        return Result.success(leaveRequestService.getByCondition(id, proposer, auditor));
    }

    @ApiOperation(value = "判断是否还有未销假的假条")
    @GetMapping("/judge/{userId}")
    public Result judgeCanRequest(@PathVariable("userId") Integer userId){
        return Result.success(leaveRequestService.count(
                new QueryWrapper<LeaveRequest>().eq("proposer", userId)
                        .eq("status", 0).or().eq("status", 1)) == 0);
    }

    @ApiOperation(value = "申请人获取未审核的请假条列表")
    @GetMapping("/auditor/{id}")
    public Result getUncheckedRequestList(@PathVariable("id") Integer id){
        return Result.success(leaveRequestService.list(new QueryWrapper<LeaveRequest>()
                .eq("status", 0).eq("auditor", id)
                .orderByDesc("create_time")));
    }

    @ApiOperation(value = "请假条通过")
    @PostMapping("/admin/proposer/pass")
    public Result pass(@RequestBody LeaveRequest leaveRequest){
        leaveRequest.setApproveTime(LocalDateTime.now());
        leaveRequest.setStatus(1);
        if (leaveRequestService.updateById(leaveRequest)){
            return Result.success("通过成功!");
        }
        return Result.fail("提交失败，稍后再试");
    }

    @ApiOperation(value = "请假条不通过")
    @PostMapping("/admin/proposer/fail")
    public Result fail(@RequestBody LeaveRequest leaveRequest){
        leaveRequest.setApproveTime(LocalDateTime.now());
        leaveRequest.setStatus(-1);
        if (leaveRequestService.updateById(leaveRequest)){
            return Result.success("提交成功!");
        }
        return Result.fail("提交失败，稍后再试");
    }

    @ApiOperation(value = "销假")
    @PostMapping("/destroy")
    public Result destroy(@RequestBody LeaveRequest leaveRequest){
        leaveRequest.setDestroyTime(LocalDateTime.now());
        leaveRequest.setStatus(2);
        if (leaveRequestService.updateById(leaveRequest)){
            return Result.success("销假成功!");
        }
        return Result.fail("销假失败，稍后再试");
    }

    @ApiOperation(value = "获取批准人列表")
    @GetMapping("/auditors/{userId}")
    public Result getAuditors(@PathVariable("userId") Integer userId){
        return Result.success(leaveRequestService.getAuditorsByUserId(userId));
    }

    @ApiOperation(value = "请假申请提交")
    @PostMapping()
    public Result requestLeave(@RequestBody LeaveRequest request){
        request.setCreateTime(LocalDateTime.now());
        if (request.getId() == null && leaveRequestService.save(request)){
            return Result.success("提交成功!",request);
        }else if (request.getId() != null && leaveRequestService.updateById(request)){
            return Result.success("更新成功!", request);
        }else {
            return Result.fail("提交出错了!");
        }
    }

    @ApiOperation(value = "删除假条")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") Integer id, Principal principal){
        MyUserDetails details = (MyUserDetails) principal;
        if (!leaveRequestService.getById(id).getProposerUser().equals(details.getUser().getId())){
            return Result.fail("暂无此权限");
        }
        if (leaveRequestService.deleteById(id)){
            return Result.success("撤回成功");
        }
        return Result.fail("");
    }
}
