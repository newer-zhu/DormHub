package com.zhuhodor.app.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.common.domain.ResultCode;
import com.zhuhodor.app.common.utils.ExcelUtils;
import com.zhuhodor.app.common.utils.TencentCos;
import com.zhuhodor.app.model.dto.LoginDto;
import com.zhuhodor.app.model.pojo.User;
import com.zhuhodor.app.model.security.MyUserDetails;
import com.zhuhodor.app.model.vo.condition.UserSearchVo;
import com.zhuhodor.app.service.IUserService;
import io.swagger.annotations.ApiOperation;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-07-25
 */
@NoArgsConstructor
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Autowired
    private IUserService userService;

    @Autowired
    private TencentCos tencentCos;

    @ApiOperation(value = "根据条件返回所有用户信息详情")
    @PostMapping("/filter")
    public Result getAllUsersByCon(@RequestBody UserSearchVo searchVo){
        return Result.success(userService.getAllUsersByCon(searchVo));
    }

    @ApiOperation(value = "登录以后返回token")
    @PostMapping(value = "/login")
    public Result login(@RequestBody LoginDto loginDto){
        return userService.login(loginDto.getUsername(), loginDto.getPassword());
    }

    @ApiOperation(value = "获取当前用户信息")
    @GetMapping("/info")
    public Result getUserInfo(Principal principal){
        if (null == principal){
            return Result.success("没有此用户信息");
        }
        MyUserDetails userDetails = userService.loadUserByUserName(principal.getName());
        User user = userDetails.getUser();
        user.setPassword(null);
        return Result.success(user);
    }

    @ApiOperation(value = "根据token获取当前用户信息")
    @PostMapping("/info")
    public Result getUserInfo(@RequestBody String token){
        return userService.getUserInfoByToken(token);
    }

    @ApiOperation(value = "用户头像删除")
    @GetMapping(value = "/avatarDelete")
    public Result uploadAvatar(@RequestParam("key") String key){
        tencentCos.deletePic(key);
        return Result.success(null);
    }


    @ApiOperation(value = "解析excel新增用户")
    @PostMapping(value = "/admin/excel/import")
    public Result parseExcel(@RequestParam("excelFile") MultipartFile excelFile){
        if (userService.updateBatchByUsername(excelFile)){
            return Result.success("上传成功");
        }
        return Result.fail("处理错误，请联系管理员");
    }

    @ApiOperation(value = "导出用户excel")
    @PostMapping(value = "/admin/excel/export")
    public void exportExcel(@RequestBody Map<String, Object> map,
                            HttpServletResponse response){
        List<User> list = userService.list(new QueryWrapper<User>()
                .select("username", "nick_name", "phone", "email", "status", "create_date", "sex"));
        try {
            ExcelUtils.exportExcel(list, (String) map.get("title"), (String) map.get("sheetName"),
                    User.class,
                    (String) map.get("fileName"), response);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("导出用户Excel失败！");
        }
    }

    @ApiOperation(value = "给用户分配角色")
    @PostMapping("/role/{userId}")
    public Result assignRoleToUser(Authentication authentication,
                                   @RequestBody List<Integer> roleList, @PathVariable("userId") Integer userId){
        MyUserDetails details =(MyUserDetails) authentication.getPrincipal();
        if (details.getUser().getId().compareTo(userId) == 0){
            return Result.fail(ResultCode.FORBIDDEN);
        }else if(userService.assignRoleToUser(roleList, userId)){
            return Result.success("操作成功！");
        } else {
            return Result.fail("内部错误，操作失败");
        }
    }

    @ApiOperation(value = "获取全部用户角色信息")
    @GetMapping("/role/info")
    public Result getAllUserWithRole(@RequestParam("username") String username){
        return Result.success(userService.getAllUsers(username));
    }

    @ApiOperation(value = "用户注册")
    @PostMapping(value = "/register")
    public Result registerUser(@RequestBody User user){
        return userService.register(user);
    }
}
