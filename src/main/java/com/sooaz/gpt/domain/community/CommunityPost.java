package com.sooaz.gpt.domain.community;

        import lombok.Data;

        import java.util.Date;

@Data
public class CommunityPost {
    private Long id;
    private Long userId;
    private String userNickname;
    private String communityPostCategory;
    private String communityPostTitle;
    private String communityPostContent;
    private Long communityPostHit;
    private Date communityPostWritedate;
    private Boolean communityPostLike;
}
