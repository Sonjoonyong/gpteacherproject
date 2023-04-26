package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.email.Gmail;
import com.sooaz.gpt.global.security.PasswordHasher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Optional;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
@Valid
public class UserSearchController {

    private final Gmail gmail;
    private final UserService userService;
    private final PasswordHasher passwordHasher;

    @GetMapping("/user/idsearch")
    public String getIdSearchForm() {
        return "user/idSearch";
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
        String maskedId = userLoginId.substring(0, 4) +
                "*".repeat(userLoginId.length() - 4);

        resultJson.put("result", true);
        resultJson.put("userLoginId", maskedId);

        return resultJson.toString();
    }

    @GetMapping("/user/pwsearch")
    public String getPwSearchForm() {
        return "user/pwSearch";
    }

    @ResponseBody
    @PostMapping("/user/pwsearch")
    public String pwSearch(
            @RequestParam String userLoginId,
            @RequestParam String userEmail
    ) {
        log.info("userLoginId = {}", userLoginId);
        log.info("userEmail = {}", userEmail);

        JSONObject resultJson = new JSONObject();
        resultJson.put("result", false);

        Optional<User> userOpt = userService.findByLoginId(userLoginId);
        User user;
        if (userOpt.isEmpty()) {
            resultJson.put("errorMsg", "존재하지 않는 아이디입니다.");
        } else {
            user = userOpt.get();
            String foundEmail = user.getUserEmail();
            if (!userEmail.equals(foundEmail)) {
                resultJson.put("errorMsg", "아이디 또는 이메일이 잘못됐습니다.");
            }
        }

        if (userLoginId.length() == 36) { // Oauth 가입자일 경우
            resultJson.put("errorMsg", "구글 등 다른 사이트를 통해 가입된 계정입니다.");
        }

        if (resultJson.has("errorMsg")) {
            return resultJson.toString();
        } else {
            user = userOpt.get();
        }

        String newPassword = UUID.randomUUID().toString()
                .replaceAll("-", "").substring(0, 10);
        log.info("발급된 임시 비밀번호 = {}", newPassword);

        UserUpdateDto userUpdateDto = new UserUpdateDto();
        userUpdateDto.setUserId(user.getId());
        userUpdateDto.setUserPassword(newPassword);
        userUpdateDto.setUserPasswordSalt(UUID.randomUUID().toString());
        userService.update(userUpdateDto);

        gmail.sendEmail(
                userEmail,
                "[GPTeacher] 재발급된 비밀번호입니다.",
                "아래 비밀번호로 접속 후 비밀번호를 변경해주세요. \n\n" +
                newPassword
        );

        resultJson.put("result", true);
        return resultJson.toString();
    }

    private boolean isValidEmailCode(HttpServletRequest request, String emailCode) {
        HttpSession session = request.getSession();
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        return realEmailCode != null && realEmailCode.equals(emailCode);
    }


}
