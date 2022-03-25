package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.dto.LoginDto;
import com.zhuhodor.server.common.utils.ExcelUtils;
import com.zhuhodor.server.common.utils.TencentCos;
import com.zhuhodor.server.model.pojo.User;
import com.zhuhodor.server.model.vo.condition.UserSearchVo;
import com.zhuhodor.server.security.component.MyUserDetails;
import com.zhuhodor.server.service.IUserService;
import io.swagger.annotations.ApiOperation;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

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

    @Autowired
    private PasswordEncoder passwordEncoder;

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
        String name = excelFile.getOriginalFilename();
        if (name.length() < 6 || !name.substring(name.length() - 5).equals(".xlsx")) {
            return Result.fail("文件格式错误");
        }
        List<User> existUser = userService.list(new QueryWrapper<User>().select("username"));
        Set<String> existUsername = existUser.stream().map(User::getUsername).collect(Collectors.toSet());
        List<User> updateList = new ArrayList<>();
        List<User> saveList = new ArrayList<>();
        try {
            List<User> list = ExcelUtils.importExcel(excelFile, User.class);
            for (User u : list){
                String username = u.getUsername();
                String password = u.getPassword();
                if (StringUtils.hasLength(password)){
                    u.setPassword(passwordEncoder.encode(u.getPassword()));
                }
                if (existUsername.contains(username)){
                    updateList.add(u);
                }else {
                    saveList.add(u);
                }
            }
            userService.saveBatch(saveList);
            //TODO 根据Excel更新用户表
//            userService.updateBatchByUsername(updateList);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("导入用户Excel表失败");
        }
        //TODO 业务逻辑，用rabbitmq使返回结果加快
        return Result.success("上传成功");
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
    public Result assignRoleToUser(@RequestBody List<Integer> roleList, @PathVariable("userId") Integer userId){
        if (userService.assignRoleToUser(roleList, userId)){
            return Result.success("操作成功！");
        }
        return Result.fail("操作失败");
    }

    @ApiOperation(value = "获取全部用户角色信息")
    @GetMapping("/role/info")
    public Result getAllUserWithRole(@RequestParam("username") String username){
        return Result.success(userService.getAllUsers(username));
    }

}
