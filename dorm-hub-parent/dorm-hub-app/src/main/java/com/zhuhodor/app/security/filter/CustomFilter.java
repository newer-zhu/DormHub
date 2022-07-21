package com.zhuhodor.app.security.filter;


import com.zhuhodor.app.model.pojo.Menu;
import com.zhuhodor.app.model.pojo.Role;

import com.zhuhodor.app.service.IMenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.Collection;
import java.util.List;

/**
 * 权限控制
 * 根据请求url分析出请求所需角色
 *
 * 自定义过滤器
 */
@Slf4j
@Component
public class CustomFilter implements FilterInvocationSecurityMetadataSource {
    @Autowired
    private IMenuService menuService;

    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    /**
     *返回访问此url所需的角色
     */
    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
        //获取请求的url
        String requestUrl = ((FilterInvocation)o).getRequestUrl();
        log.info("当前访问的URL============={}", requestUrl);
        //获取菜单
        List<Menu> menus = menuService.getMenusWithRole();
        for (Menu menu : menus) {
            //判断请求的url与菜单角色是否匹配，匹配则返回所需角色
            if (antPathMatcher.match(menu.getUrl(),requestUrl)){
                log.info("数据库查询的url==>[{}]和当前访问的url==>[{}]相匹配", menu.getUrl(), requestUrl);
                String[] str = menu.getRoles().stream().map(Role::getRoleName).toArray(String[]::new);
                return SecurityConfig.createList(str);
            }
        }
        log.info("当前访问的url===[{}]在数据库约定之外！登录状态就能访问", requestUrl);
        //没匹配的url默认为登录即可访问
        return SecurityConfig.createList("ROLE_LOGIN");
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
