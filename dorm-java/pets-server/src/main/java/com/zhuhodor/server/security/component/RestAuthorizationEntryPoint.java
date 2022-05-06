package com.zhuhodor.server.security.component;

import cn.hutool.json.JSONUtil;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.common.domain.ResultCode;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 未登录或者token失效的返回结果
 */
@Component
public class RestAuthorizationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();
        Result result = Result.fail(ResultCode.UNAUTHORIZED);
        writer.write(JSONUtil.toJsonStr(result));
        writer.flush();
        writer.close();
    }
}
