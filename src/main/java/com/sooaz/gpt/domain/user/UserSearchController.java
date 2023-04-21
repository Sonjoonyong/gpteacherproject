package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.email.Gmail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Optional;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserSearchController {

    private final Gmail gmail;
    private final UserService userService;

    @GetMapping("/user/idsearch")
    public String getIdSearchForm() {
        return "user/idSearch";
    }


    @ResponseBody
    @PostMapping("/user/idsearch")
    public String idSearch(
            @Email(message = "유효한 이메일 형식이 아닙니다.")
            @NotBlank(message = "이메일을 입력해주세요.")
            String email,
            HttpServletRequest request
    ) {
        Optional<User> userOpt = userService.findByEmail(email);
        if (userOpt.isPresent()) {
            String userLoginId = userOpt.get().getUserLoginId();
            gmail.sendEmail(
                    email,
                    "GPTeacher 아이디입니다.",
                    userLoginId.substring(0, 5) + "*".repeat(userLoginId.length() - 4) // 앞 4자리만 표기
            );

            return "true";
        }

        return "false";
    }


    @ResponseBody
    @GetMapping("/user/idsearch/emailCode")
    public String getIdSearchEmailCode(
            @Email(message = "유효한 이메일 형식이 아닙니다.")
            @NotBlank(message = "이메일을 입력해주세요.")
            String email,
            HttpServletRequest request
    ) {
        Optional<User> userOpt = userService.findByEmail(email);
        if (userOpt.isEmpty()) {
            return "등록되지 않은 이메일입니다.";
        }

        String userLoginId = userOpt.get().getUserLoginId();
        if (userLoginId.length() == 36) { // Oauth 가입자일 경우
            return "구글 등 다른 사이트를 통해 가입된 계정입니다.";
        }

        String emailCode = UUID.randomUUID().toString()
                .replaceAll("-", "").substring(0, 5);
        log.info("발급된 emailCode = {}", emailCode);

        gmail.sendEmail(
                email,
                "GPTeacher 아이디 찾기 인증코드입니다.",
                "아래 코드를 인증 창에 입력 후 아이디 찾기를 진행하세요. \n\n" +
                        emailCode
        );

        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.EMAIL, email);
        session.setAttribute(SessionConst.EMAIL_CODE, emailCode);

        return "true";
    }

    @ResponseBody
    @PostMapping(value = "/user/idsearch/emailCode", produces = "application/json; charset=utf-8")
    public String validateIdSearchEmailCode(
            @RequestParam String userEmailCode,
            HttpServletRequest request
    ) {
        JSONObject resultJson = new JSONObject();
        resultJson.put("result", false);

        if (!isValidEmailCode(request, userEmailCode)) {
            resultJson.put("errorMsg", "코드가 유효하지 않습니다.");
        }

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute(SessionConst.EMAIL);
        if (email == null) {
            resultJson.put("errorMsg", "이메일을 입력해주세요.");
        }


        if (resultJson.has("errorMsg")) {
            return resultJson.toString();
        }

        User user = userService.findByEmail(email).orElse(null);
        String userLoginId = user.getUserLoginId();
        String maskedId = userLoginId.substring(0, 5) + "*".
                repeat(userLoginId.length() - 3);

        resultJson.put("result", true);
        resultJson.put("userLoginId", maskedId);

        return resultJson.toString();
    }

    private boolean isValidEmailCode(HttpServletRequest request, String emailCode) {
        HttpSession session = request.getSession();
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        return realEmailCode != null && realEmailCode.equals(emailCode);
    }


}
