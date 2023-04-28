package com.sooaz.gpt.domain.mypage;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.domain.user.UserService;
import com.sooaz.gpt.domain.user.UserUpdateDto;
import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.security.PasswordHasher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Map;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageAccountController {

    private final PasswordHasher passwordHasher;
    private final UserService userService;

    @GetMapping("/user/mypage/withdraw")
    public String getWithdrawForm() {
        return "mypage/account/withdraw";
    }

    @ResponseBody
    @PostMapping("/user/mypage/withdraw")
    public String withdraw(
            @RequestParam String userPassword,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            HttpServletRequest request
    ) {
        log.info("userPassword = {}", userPassword);

        if (loginUser == null) {
            return "false";
        }

        if (loginUser.getUserRole() == UserRole.ADMIN) {
            return "false";
        }

        String hashedPassword = passwordHasher.hash(
                userPassword,
                loginUser.getUserPasswordSalt()
        );

        if (loginUser.getUserPassword().equals(hashedPassword)) {
            userService.delete(loginUser.getId());
            log.info("회원 탈퇴: loginUser = {}", loginUser);
            request.getSession().invalidate();
            return "true";
        }

        return "false";
    }

    @GetMapping("/user/mypage/edit")
    public String getUserEditForm(
            HttpServletRequest request,
            Model model,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        // 성공 시
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null && flashMap.containsKey("isEditSucceed")) {
            model.addAttribute("isEditSucceed", flashMap.get("isEditSucceed"));
        }

        UserEditInfoDto userEditInfoDto = new UserEditInfoDto();
        userEditInfoDto.setUserEmailAgreement(loginUser.getUserEmailAgreement());
        userEditInfoDto.setUserNickname(loginUser.getUserNickname());
        model.addAttribute("userEditInfoDto", userEditInfoDto);

        return "mypage/account/editUserInfo";
    }

    @PostMapping("/user/mypage/edit")
    public String userEdit(
            @ModelAttribute UserEditInfoDto userEditInfoDto,
            BindingResult bindingResult,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            RedirectAttributes redirectAttributes,
            HttpServletRequest request
    ) {
        if (loginUser == null) {
            return "mypage/account/editUserInfo";
        }

        String userPassword = userEditInfoDto.getUserPassword();
        if (userPassword == null || !userService.isCorrectPassword(loginUser, userPassword)) {
            bindingResult.rejectValue("userPassword", "incorrect", "비밀번호가 틀렸습니다.");
        }

        String userNickname = userEditInfoDto.getUserNickname();
        if (userNickname != null
                && !userNickname.equals(loginUser.getUserNickname())  // 본인 닉네임일 경우 허용
                && userService.isDuplicateNickname(userNickname)
        ) {
            bindingResult.rejectValue("userNickname", "duplicate", "중복되는 닉네임입니다.");
        }

        if (bindingResult.hasErrors()) {
            return "mypage/account/editUserInfo";
        }

        UserUpdateDto userUpdateDto = new UserUpdateDto();
        userUpdateDto.setUserId(loginUser.getId());
        userUpdateDto.setUserNickname(userNickname);
        userUpdateDto.setUserEmailAgreement(userEditInfoDto.getUserEmailAgreement());

        userService.update(userUpdateDto);
        // 업데이트 후 세션 정보도 갱신
        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.LOGIN_USER, userService.findById(loginUser.getId()).orElse(null));

        redirectAttributes.addFlashAttribute("isEditSucceed", true);
        return "redirect:/user/mypage/edit";
    }

    @ResponseBody
    @GetMapping("/user/mypage/checkNickname")
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

    @GetMapping("/user/mypage/edit/pw")
    public String getChangePwForm(
            HttpServletRequest request,
            Model model
    ) {
        model.addAttribute("userEditPwDto", new UserEditPwDto());

        // 성공 시
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null && flashMap.containsKey("isEditSucceed")) {
            model.addAttribute("isEditSucceed", flashMap.get("isEditSucceed"));
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
