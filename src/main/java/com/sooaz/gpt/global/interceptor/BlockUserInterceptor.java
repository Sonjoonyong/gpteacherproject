package com.sooaz.gpt.global.interceptor;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.global.constant.SessionConst;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;

public class BlockUserInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession(false);

        if (session == null) {
            return true;
        }

        User loginUser =  (User) session.getAttribute(SessionConst.LOGIN_USER);

        if (loginUser == null) {
            return true;
        }

        // 로그인 된 상태면 차단 여부 확인
        Date blockDate = loginUser.getBlockDate();
        if (blockDate != null) {
            String encodedMsg = URLEncoder.encode("부적절한 이용으로 활동이 차단되었습니다.", StandardCharsets.UTF_8);
            response.sendRedirect("/main?message=" + encodedMsg);
            return false;
        }

        return true;
    }
}
