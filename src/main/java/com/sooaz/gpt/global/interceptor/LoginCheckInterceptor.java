package com.sooaz.gpt.global.interceptor;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestUri = request.getRequestURI();

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute(SessionConst.LOGIN_USER) != null) {
            User loginUser = (User) session.getAttribute(SessionConst.LOGIN_USER);
            request.setAttribute("loginUser", loginUser);
        }

        return true;
    }


}
