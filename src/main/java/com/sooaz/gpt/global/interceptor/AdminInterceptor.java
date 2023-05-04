package com.sooaz.gpt.global.interceptor;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.global.constant.SessionConst;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;


public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);

        if (session == null) {
            String encodedMsg = URLEncoder.encode("접근 권한이 없습니다.", StandardCharsets.UTF_8);
            response.sendRedirect("/main?message=" + encodedMsg);
            return false;
        }

        User loginUser = (User) session.getAttribute(SessionConst.LOGIN_USER);
        UserRole userRole = loginUser.getUserRole();
        if (userRole != UserRole.ADMIN) {
            String encodedMsg = URLEncoder.encode("접근 권한이 없습니다.", StandardCharsets.UTF_8);
            response.sendRedirect("/main?message=" + encodedMsg);
            return false;
        }

        return true;
    }
}
