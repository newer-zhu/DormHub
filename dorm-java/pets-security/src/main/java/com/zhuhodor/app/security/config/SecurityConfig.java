package com.zhuhodor.app.security.config;

import com.zhuhodor.app.model.security.MyUserDetails;
import com.zhuhodor.app.security.component.RestAccessDeniedHandler;
import com.zhuhodor.app.security.component.RestAuthorizationEntryPoint;
import com.zhuhodor.app.security.filter.CustomFilter;
import com.zhuhodor.app.security.filter.CustomUrlDecisionManager;
import com.zhuhodor.app.security.filter.JwtAuthenticationFilter;
import com.zhuhodor.app.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private IUserService userService;

    @Autowired
    private RestAuthorizationEntryPoint restAuthorizationEntryPoint;
    @Autowired
    private RestAccessDeniedHandler restAccessDeniedHandler;
    @Autowired
    private CustomFilter customFilter;
    @Autowired
    private CustomUrlDecisionManager customUrlDecisionManager;

    @Bean
    public UserDetailsService userDetailsService(){
        return username -> {
            MyUserDetails userDetails = userService.loadUserByUserName(username);
            return userDetails;
        };
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter(){
        return new JwtAuthenticationFilter();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .anyRequest()
                .authenticated()
                //动态权限配置
                .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
                    @Override
                    public <O extends FilterSecurityInterceptor> O postProcess(O o) {
                        o.setAccessDecisionManager(customUrlDecisionManager);
                        o.setSecurityMetadataSource(customFilter);
                        return o;
                    }
                })
                .and()
                .headers()
                .cacheControl();
        http.addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);
        http.exceptionHandling()
                .accessDeniedHandler(restAccessDeniedHandler)
                .authenticationEntryPoint(restAuthorizationEntryPoint);

        http.sessionManagement()//Session管理器
                .maximumSessions(1)
                .expiredUrl("/user/login");
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        //忽略路径
        web.ignoring().antMatchers(
                "/user/login",
                "/css/**",
                "/js/**",
                "/index.html",
                "favicon.ico",
                "/doc.html",
                "/webjars/**",
                "/swagger-resources/**",
                "/v2/api-docs/**",
                "/ws/**"
        );
    }
}
