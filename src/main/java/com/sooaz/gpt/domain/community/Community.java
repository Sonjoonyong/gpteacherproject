package com.sooaz.gpt.domain.community;

        import lombok.Data;

        import java.util.Date;

@Data
public class Community {
    private Long id;
    private Long userId;
    private String communityPostCategory;
    private String communityPostTitle;
    private String communityPostContent;
    private Integer communityPostHit;
    private Date communityPostWritedate;
    private Boolean communityPostLike;
}
