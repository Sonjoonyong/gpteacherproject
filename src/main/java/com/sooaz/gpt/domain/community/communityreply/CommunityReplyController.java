package com.sooaz.gpt.domain.community.communityreply;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequiredArgsConstructor
@RestController
public class CommunityReplyController {

    private final CommunityReplyService service;
}
