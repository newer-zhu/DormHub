package com.zhuhodor.app.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.common.exceptions.ApiException;
import com.zhuhodor.app.common.utils.ExcelUtils;
import com.zhuhodor.app.common.utils.JwtUtil;
import com.zhuhodor.app.mapper.DormMapper;
import com.zhuhodor.app.mapper.UserMapper;
import com.zhuhodor.app.mapper.UserRoleMapper;
import com.zhuhodor.app.model.dto.UserRole;
import com.zhuhodor.app.model.pojo.User;
import com.zhuhodor.app.model.security.MyUserDetails;
import com.zhuhodor.app.model.vo.condition.UserSearchVo;
import com.zhuhodor.app.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhuhodor
 * @since 2021-07-25
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    @Value("${jwt.tokenHead}")
    private String tokenHead;
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private DormMapper dormMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    @PostConstruct
    public void init(){
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public Result login(String username, String password) {
        //登录
        MyUserDetails userDetails = loadUserByUserName(username);

        if (userDetails == null || !passwordEncoder.matches(password,userDetails.getPassword())){
            return Result.fail("用户名或密码不正确");
        }
        if (!userDetails.isEnabled()){
            return Result.fail("账号被禁用");
        }

        //更新security登录用户对象
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails,
                null,userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);

        //生成token
        String token = jwtUtil.generateToken(userDetails);
        Map<String,Object> tokenMap = new HashMap<>();
        tokenMap.put("token",token);
        userDetails.getUser().setPassword(null);
        userDetails.getUser().setDorm(dormMapper.selectById(userDetails.getUser().getDormId()));
        tokenMap.put("userInfo", userDetails.getUser());
        tokenMap.put("tokenHead",tokenHead);
        return Result.success("登录成功",tokenMap);
    }

    @Override
    public MyUserDetails loadUserByUserName(String username) {
        User user = userMapper.getUserByUserName(username);
        return user == null? null : new MyUserDetails(user);
    }

    @Override
    public Result register(User user) {
        if (userMapper.selectCount(new QueryWrapper<User>().eq("username", user.getUsername())) > 0){
            return Result.fail("用户名已存在");
        }else {
            user.setCreateDate(LocalDate.now());
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            if (userMapper.insert(user) == 1){
                MyUserDetails userDetails = new MyUserDetails(user);
                //更新security登录用户对象
                UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails,
                        null,userDetails.getAuthorities());
                SecurityContextHolder.getContext().setAuthentication(authenticationToken);

                //生成token
                String token = jwtUtil.generateToken(userDetails);
                Map<String,Object> tokenMap = new HashMap<>();
                tokenMap.put("token",token);
                user.setPassword(null);
                tokenMap.put("userInfo", user);
                tokenMap.put("tokenHead",tokenHead);
                return Result.success("注册成功！", tokenMap);
            }else {
                return Result.fail("注册失败！");
            }
        }
    }

    @Override
    public Result getUserInfoByToken(String token) {
        if (token.length() != 0){
            String authToken = token.substring(tokenHead.length());
            String username = jwtUtil.getUsernameByToken(authToken);
            MyUserDetails userDetails = loadUserByUserName(username);
            Assert.notNull(userDetails);
            User user = userDetails.getUser();
            user.setPassword(null);
            return Result.success(user);
        }else {
            return Result.fail("请登录");
        }
    }

    @Override
    public List<User> getAllUsersByCon(UserSearchVo searchVo) {
        return userMapper.getAllUsersByCon(searchVo);
    }

    @Transactional
    @Override
    public Boolean assignRoleToUser(List<Integer> roleList, Integer userId) {
        userRoleMapper.delete(new QueryWrapper<UserRole>().eq("u_id", userId));
        for (int rId : roleList){
            userRoleMapper.insert(new UserRole(userId, rId));
        }
        return true;
    }

    @Override
    public List<User> getAllUsers(String username) {
        return userMapper.getAllUsers(username);
    }

    @Transactional
    @Override
    public boolean updateBatchByUsername(MultipartFile excelFile) {
        String name = excelFile.getOriginalFilename();
        if (name.length() < 6 || !name.substring(name.length() - 5).equals(".xlsx")) {
            throw new ApiException("文件格式错误");
        }

        //已经存在的User
        List<User> existUser = userMapper.selectList(new QueryWrapper<User>().select("username"));
        Set<String> existUsername = existUser.stream().map(User::getUsername).collect(Collectors.toSet());
        //更新的用户
        List<User> updateList = new ArrayList<>();
        //新增的用户
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
            saveList.forEach( user -> userMapper.insert(user));
            updateList.forEach(u -> {
                userMapper.update(u, new QueryWrapper<User>().eq("username", u.getUsername()));
            });
        } catch (IOException e) {
            e.printStackTrace();
            log.error("导入用户Excel表失败");
            throw new ApiException("导入用户Excel表失败");
        }
        return true;
    }
}
