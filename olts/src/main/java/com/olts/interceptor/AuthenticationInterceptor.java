package com.olts.interceptor;

import com.olts.vo.OltsUser;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 访问安全认证
 * 用户只有登录后才有权限访问系统
 *
 * @author 张建平 on 2018/10/6 11:06
 */
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    static Logger logger = Logger.getLogger(AuthenticationInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        OltsUser logUser = (OltsUser) request.getSession().getAttribute("logUser");
        logger.info("用户信息：" + logUser);
        // 未登录
        if (logUser == null) {
            logger.warn("未登录授权，禁止访问系统，请重新登录!");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            // springmvc中断处理流程
            return false;
        }
        return super.preHandle(request, response, handler);
    }
}
