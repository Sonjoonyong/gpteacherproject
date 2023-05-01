package com.sooaz.gpt.domain.mypage.account;

import com.sooaz.gpt.domain.mypage.UserEditPwDto;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserService;
import com.sooaz.gpt.domain.user.UserUpdateDto;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PasswordController {

    private final UserService userService;

    @GetMapping("/user/mypage/edit/pw")
    public String getChangePwForm(
            HttpServletRequest request,
            Model model,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        model.addAttribute("userEditPwDto", new UserEditPwDto());

        // 성공 시 메시지 출력
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null && flashMap.containsKey("isEditSucceed")) {
            model.addAttribute("isEditSucceed", flashMap.get("isEditSucceed"));
        }

        String userLoginId = loginUser.getUserLoginId();
        if (userLoginId.length() == 36) {
            return "redirect:/user/mypage/edit";
        }

        return "mypage/account/changePassword";
    }


    @PostMapping("/user/mypage/edit/pw")
    public String changePw(
            @Valid @ModelAttribute UserEditPwDto userEditPwDto,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        String userNewPassword = userEditPwDto.getUserNewPassword();
        String userNewPasswordCheck = userEditPwDto.getUserNewPasswordCheck();

        if (!bindingResult.hasFieldErrors("userNewPassword")
                && !userNewPassword.equals(userNewPasswordCheck)
        ) {
            bindingResult.rejectValue("userNewPasswordCheck", "새 비밀번호와 다릅니다.");
        }

        if (bindingResult.hasErrors()) {
            return "mypage/account/changePassword";
        }

        UserUpdateDto userUpdateDto = new UserUpdateDto();
        userUpdateDto.setUserId(loginUser.getId());
        userUpdateDto.setUserPassword(userNewPassword);
        userUpdateDto.setUserPasswordSalt(UUID.randomUUID().toString());
        userService.update(userUpdateDto);

        redirectAttributes.addFlashAttribute("isEditSucceed", true);

        return "redirect:/user/mypage/edit/pw";
    }

}
