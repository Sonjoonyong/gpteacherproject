package com.sooaz.gpt.domain.community.communityreply;


import com.sooaz.gpt.domain.admin.faq.Faq;
import com.sooaz.gpt.domain.admin.faq.FaqCreateDto;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
//@RequestMapping("/community")
@Slf4j
public class CommunityReplyController {

    private final CommunityReplyService communityReplyService;

    @PostMapping("/replySend")
    public String replySend(CommunityReply communityreply, HttpServletRequest request, @RequestParam("communityReplyId") Long communityReplId){
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        communityreply.setUserId(loginUser.getId());

        CommunityReply result = communityReplyService.replyInsert(communityreply);

        return result+"";
    }


    @GetMapping("/community/communityReplyList")
    public List<communityReply> replyList(@RequestParam("communityReplyId")Long communityReplId){
        return communityReplyService.replyListSelect(communityReplyId);
    }

    @PostMapping("/replyEdit")
    public String replyEdit(CommunityReply communityreply, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        communityreply.setUserId(loginUser.getId());
        CommunityReply result = communityReplyService.replyUpdate(communityreply);
        return String.valueOf(result);
    }

    @GetMapping("/replyDelete")
    public String replyDelete(CommunityReply communityreply, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        communityreply.setUserId(loginUser.getId());
        CommunityReply result = communityReplyService.replyDelete(communityreply);
        return String.valueOf(result);
    }
//    @PostMapping("/community/{communityPostId}/reply")
//    public String reply(
//            @PathVariable Long communityPostId,
//            @RequestParam String communityReplyContent,
//            HttpServletRequest request
////            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
//    ) {
//
//        HttpSession session = request.getSession();
//        User loginUser = (User) session.getAttribute(SessionConst.LOGIN_USER);
//
//
//        if (loginUser == null) {
//            return "redirect:/community/view?communityPostId=" + communityPostId;
//        }
//
//        // 댓글 달기
//        CommunityReply communityReply = new CommunityReply();
//        communityReply.setUserId(loginUser.getId());
//        communityReply.setCommunityReplyContent(communityReplyContent);
//        communityReply.setCommunityPostId(communityPostId);
//        communityReplyService.reply(communityReply);
//
//        return "redirect:/community/view?communityId=" + communityPostId;
//    }
//




//    @GetMapping("/view")
//    public String getCommunityReplyById(@RequestParam("communityId") Long id, Model model) {
//        model.addAttribute("communityReply", communityReplyService.getCommunityReplyById(id));
//        return "community/postView";
//    }
//    @GetMapping("/write")
//    public String showCommunityReplyWritePage(Model model,HttpServletRequest request) {
//       // model.addAttribute("communityReply", new CommunityReply());
////        HttpSession session = request.getSession();
////        User loginUser = (User) session.getAttribute("loginUser");
//
//
////        if (loginUser != null && UserRole.ADMIN.equals(loginUser.getUserRole())) {
////            model.addAttribute("communityReply", new CommunityReply());
////            return "community/View";
////        } else {
////            return "redirect:/community/list";
////        }
//
//      return "community/postView";//replynew는 없을 거 같아서 변경 X
//    }
//
//    @PostMapping("/write")
//    public String createCommunityReply(@ModelAttribute CommunityReply communityReply, RedirectAttributes redirectAttributes, HttpServletRequest request) {
////        HttpSession session = request.getSession();
////        User loginUser = (User) session.getAttribute("loginUser");
////
////        if (loginUser != null) {
////            communityReply.setUserId(loginUser.getId());
//////           커뮤니티 dto 가면 작동을 안 함 이유를 모르겠음
////            communityReplyService.createCommunityReply(communityReply);
////            redirectAttributes.addFlashAttribute("message", "댓글이 등록되었습니다.");
////            return "redirect:/community/view";
////        } else {
////            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
////            return "redirect:/user/login";
////        }
//        return "community/postView";
//    }
//
//    @PostMapping("/update/{id}")
//    public String updateCommunityReply(@PathVariable Long id, @ModelAttribute CommunityReply communityReply, RedirectAttributes redirectAttributes) {
//        communityReplyService.updateCommunityReply(id, communityReply);
//        redirectAttributes.addFlashAttribute("message", "댓글이 업데이트 되었습니다.");
//        return "redirect:/community/view";
//    }
//    @PostMapping("/edit/{id}")
//    public String editCommunityReply(@PathVariable Long id, @ModelAttribute CommunityReply communityReply, RedirectAttributes redirectAttributes){
//        communityReplyService.editCommunityReply(id, communityReply);
//        redirectAttributes.addFlashAttribute("message", "댓글이 변경되었습니다.");
//        return "redirect:/community/view";
//       // @ModelAttribute CommunityReply communityReply,   54행 괄호 안에 있던거인데 삭제하고 밑으로 둠
//    }
//        @PostMapping("/delete/{id}")
//        public String deleteCommunityReply(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
//            communityReplyService.deleteCommunityReply(id);
//            redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
//            return "redirect:/community/view";//문제가 생기면 /community 삭제 권장
//        }
//            @PostMapping("")
//            public String saveCommunityReply(HttpServletRequest request,
//                                                  @RequestParam int ref_group)
//            {
//                service.saveComment(request);
//                return new ModelAndView("redirect:/cafe/detail.do?num="+ref_group);
//            }
    }


