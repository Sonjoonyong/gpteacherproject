package com.sooaz.gpt.domain.admin.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

    @GetMapping("/help/notice/list")
    public String noticeList() {
        return "notice/noticeList";
    }
}