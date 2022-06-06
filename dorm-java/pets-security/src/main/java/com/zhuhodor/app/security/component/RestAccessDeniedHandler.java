package com.zhuhodor.app.security.component;


import cn.hutool.json.JSONUtil;
import com.zhuhodor.app.common.domain.Result;
import com.zhuhodor.app.common.domain.ResultCode;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 没有权限时的返回结果
 */
@Component
public class RestAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();
        Result result = Result.fail(ResultCode.FORBIDDEN);
        writer.write(JSONUtil.toJsonStr(result));
        writer.flush();
        writer.close();
    }

}
