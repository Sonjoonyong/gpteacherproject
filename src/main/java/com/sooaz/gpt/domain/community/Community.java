package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.learning.LearningTestType;
import com.sooaz.gpt.domain.learning.LearningType;
import lombok.Data;

import java.util.Date;

@Data
public class Community {
    private Long id;
    private Long userId;
    private String communityPostCategory;
    private String communityTitle;
    private String communityContent;
    private Integer communityPostHit;
    private Date communityPostWirtedate;
    public void setCommunityPostWriteDate(Date communiytPostWriteDate) {this.communityPostWirtedate = communiytPostWriteDate;}
    private Boolean communityPostLike;
    //
    //
}
