package com.sooaz.gpt.domain.mypage.account;

import com.sooaz.gpt.domain.mypage.UserEditInfoDto;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserService;
import com.sooaz.gpt.domain.user.UserUpdateDto;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
@Valid
public class UserInfoController {

    private final UserService userService;

    @ResponseBody
    @GetMapping("/user/mypage/edit/checkNickname")
    public String checkNicknameDup(
            @RequestParam String userNickname,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        // (String) true: 중복, false: 사용 가능, 그 외: 오류 메시지
        if (userNickname == null) {
            return "닉네임을 입력해주세요";
        }

        if (userNickname.equals(loginUser.getUserNickname())) {
            // 본인 닉네임 사용 가능
            return "false";
        }

        if (userNickname.length() < 2 || userNickname.length() > 8) {
            return "2~8글자 범위로 입력해주세요.";
        }

        return String.valueOf(userService.isDuplicateNickname(userNickname));
    }

    @GetMapping("/user/mypage/edit")
    public String getEditForm(
            HttpServletRequest request,
            Model model,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        // 성공 시
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null && flashMap.containsKey("isEditSucceed")) {
            model.addAttribute("isEditSucceed", flashMap.get("isEditSucceed"));
        }
        if (flashMap != null && flashMap.containsKey("errorMsg")) {
            model.addAttribute("errorMsg", flashMap.get("errorMsg"));
        }

        UserEditInfoDto userEditInfoDto1 = new UserEditInfoDto();
        userEditInfoDto1.setUserEmailAgreement(loginUser.getUserEmailAgreement());
        userEditInfoDto1.setUserNickname(loginUser.getUserNickname());

        String userLoginId = loginUser.getUserLoginId();
        if (userLoginId.length() == 36) {
            userEditInfoDto1.setUserLoginId("N/A (SNS 연동 계정)");
        } else {
            userEditInfoDto1.setUserLoginId(loginUser.getUserLoginId());
        }
        UserEditInfoDto userEditInfoDto = userEditInfoDto1;

        model.addAttribute("userEditInfoDto", userEditInfoDto);

        return "mypage/account/editUserInfo";
    }

    /**
     * 이메일 코드 전송
     */
    @ResponseBody
    @GetMapping("/user/mypage/edit/emailCode")
    public String getEmailCode(
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        String userEmail = loginUser.getUserEmail();
        userService.sendEmailCode(userEmail);

        return "true";
    }

    /**
     * 이메일 인증 후 회원 정보 변경
     */
    @PostMapping("/user/mypage/edit")
    public String editInfo(
            @NotBlank(message = "이메일 코드를 입력해주세요.")
            String userEmailCode,
            Boolean userEmailAgreement,
            @NotBlank
            String userNickname,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            RedirectAttributes redirectAttributes,
            HttpServletRequest request
    ) {
        String userEmail = loginUser.getUserEmail();

        log.info("userEmail = {}", userEmail);
        log.info("userEmailCode = {}", userEmailCode);
        log.info("userEmailAgreement = {}", userEmailAgreement);
        log.info("userNickname = {}", userNickname);

        if (!userNickname.equals(loginUser.getUserNickname())
                && userService.isDuplicateNickname(userNickname)) {
            redirectAttributes.addFlashAttribute("errorMsg", "이미 존재하는 닉네임입니다.");
            return "redirect:/user/mypage/edit";
        }

        if (!userService.isValidEmailCode(userEmail, userEmailCode)) {
            redirectAttributes.addFlashAttribute("errorMsg", "코드가 유효하지 않거나 만료되었습니다.");
            return "redirect:/user/mypage/edit";
        }

        userService.invalidEmailCode(userEmail);

        // 유저 업데이트
        UserUpdateDto updateDto = new UserUpdateDto();
        updateDto.setUserId(loginUser.getId());
        updateDto.setUserNickname(userNickname);
        updateDto.setUserEmailAgreement(userEmailAgreement == null? false : userEmailAgreement);
        userService.update(updateDto);

        // 세션 유저 정보도 갱신
        User updatedUser = userService.findByEmail(userEmail).orElseThrow(IllegalStateException::new);
        request.getSession().setAttribute(SessionConst.LOGIN_USER , updatedUser);

        redirectAttributes.addFlashAttribute("isEditSucceed", "회원 정보가 변경되었습니다.");

        return "redirect:/user/mypage/edit";
    }


    @ResponseBody
    @PostMapping("/user/mypage/edit/emailCode")
    public String validateEmailCode(
            @RequestParam String emailCode,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        String userEmail = loginUser.getUserEmail();
        return String.valueOf(userService.isValidEmailCode(userEmail, emailCode));
    }
}
