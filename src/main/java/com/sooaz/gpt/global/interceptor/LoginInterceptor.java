package com.sooaz.gpt.global.interceptor;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.global.constant.SessionConst;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestUri = request.getRequestURI();

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("/user/login?redirectUri=" + requestUri);
            return false;
        }

        User loginUser =  (User) session.getAttribute(SessionConst.LOGIN_USER);
        if (loginUser == null) {
            response.sendRedirect("/user/login?redirectUri=" + requestUri);
            return false;
        }

        return true;
    }
}
