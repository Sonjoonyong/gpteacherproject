package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service//지울 수 있음
@Data
public class MyReplyDto {
    private Long id;
    private Long communityPostId;
    private String communityPostTitle;
    private String communityReplyContent;
    private Date communityReplyWritedate;
}
