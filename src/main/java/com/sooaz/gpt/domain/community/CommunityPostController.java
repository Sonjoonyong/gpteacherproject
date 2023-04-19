package com.sooaz.gpt.domain.community;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.admin.notice.Notice;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community/list")
@Slf4j
public class CommunityPostController {
    @GetMapping("/list")
    public String getCommunity( @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                                @RequestParam(value = "search", required = false) String search,
                             Model model) {
        PageHelper.startPage(pageNum, pageSize);
        List<Community> community = CommunityPostService.getAllCommunity(search);
        PageInfo<Community> pageInfo = new PageInfo<>(community);
        model.addAttribute("pageInfo", pageInfo);
        return "community/postlist";
    }
}


//@GetMapping("/community/list")
//    public String getTopicForm() {
//        return "/community/postList";
//    }
//
//    @GetMapping("/community/{postId}")
//    public String viewPost(@PathVariable Long postId) {
//        return "/community/postView";
//    }
//    @GetMapping("/community/write")
//    public String viewWrite(){
//      return "write";
//    }
//   @PostMapping("/community/write")
//    public String write(@ModelAttribute CommunityUpdateDto communityDTO) {
//       int writeResult = CommunityPostService.write(communityDTO);
//       if (writeResult > 0) {
//           return "redirect:/community/";
//       } else {
//           return "write";
//       }
//   }