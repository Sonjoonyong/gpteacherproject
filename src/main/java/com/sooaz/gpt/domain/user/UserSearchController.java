package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.email.Gmail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.Optional;
import java.util.Random;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
@Valid
public class UserSearchController {

    private final Gmail gmail;
    private final UserService userService;

    @GetMapping("/user/idsearch")
    public String getIdSearchForm(
            Model model
    ) {
        model.addAttribute("userSecurityQuestions", UserService.USER_SECURITY_QUESTIONS);
        return "user/idSearch";
    }

    @ResponseBody
    @GetMapping("/user/idsearch/emailCode")
    public String getIdSearchEmailCode(
            @Email(message = "유효한 이메일 형식이 아닙니다.")
            @NotBlank(message = "이메일을 입력해주세요.")
            String email
    ) {
        Optional<User> userOpt = userService.findByEmail(email);
        if (userOpt.isEmpty()) {
            return "등록되지 않은 이메일입니다.";
        }

        String userLoginId = userOpt.get().getUserLoginId();
        if (userLoginId.length() == 36) { // Oauth 가입자일 경우
            return "구글 등 다른 사이트를 통해 가입된 계정입니다.";
        }

        userService.sendEmailCode(email);

        return "true";
    }

    @ResponseBody
    @PostMapping(value = "/user/idsearch/emailCode", produces = "application/json; charset=utf-8")
    public String validateIdSearchEmailCode(
            @NotBlank(message = "이메일을 입력해주세요.")
            String userEmail,
            @NotBlank(message = "이메일 코드를 입력해주세요.")
            String userEmailCode,
            @NotBlank(message = "질문을 선택해주세요.")
            String userSecurityQuestion,
            @NotBlank(message = "답변을 입력해주세요.")
            String userSecurityAnswer
    ) {
        log.info("userEmail = {}", userEmail);
        log.info("userEmailCode = {}", userEmailCode);
        log.info("userSecurityQuestion = {}", userSecurityQuestion);
        log.info("userSecurityAnswer = {}", userSecurityAnswer);

        JSONObject resultJson = new JSONObject();
        resultJson.put("result", false);

        Optional<User> loginUserOpt = userService.findByEmail(userEmail);
        if (loginUserOpt.isEmpty()) {
            resultJson.put("errorMsg", "가입되지 않은 이메일입니다.");
            return resultJson.toString();
        }

        User loginUser = loginUserOpt.get();

        if (!loginUser.getUserSecurityQuestion().equals(userSecurityQuestion)) {
            resultJson.put("errorMsg", "질문 또는 답변이 잘못됐습니다.");
        }

        if (!loginUser.getUserSecurityAnswer().equals(userSecurityAnswer)) {
            resultJson.put("errorMsg", "질문 또는 답변이 잘못됐습니다.");
        }

        if (!userService.isValidEmailCode(userEmail, userEmailCode)) {
            resultJson.put("errorMsg", "코드가 유효하지 않거나 만료되었습니다.");
        }

        if (resultJson.has("errorMsg")) {
            return resultJson.toString();
        }

        User user = userService.findByEmail(userEmail).orElseThrow(IllegalStateException::new);
        String userLoginId = user.getUserLoginId();
        userService.invalidEmailCode(userEmail);

        resultJson.put("result", true);
        resultJson.put("userLoginId", userLoginId);

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

        String[] specialChars = {"@", "$", "!", "%", "*", "#", "?", "&"};
        int randomIndex = (int) (Math.random() * specialChars.length);
        String randomChar = specialChars[randomIndex];

        String newPassword = UUID.randomUUID().toString()
                .replaceAll("-", "").substring(0, 10)
                + randomChar;

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

        userService.invalidEmailCode(userEmail);

        resultJson.put("result", true);
        return resultJson.toString();
    }

}
