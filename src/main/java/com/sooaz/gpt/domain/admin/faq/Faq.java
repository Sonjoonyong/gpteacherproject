package com.sooaz.gpt.domain.admin.faq;

import lombok.Data;

@Data
public class Faq {
    private Long id;
    private Long userId;
    private String userNickname;
    private String faqCategory;
    private String faqTitle;
    private String faqContent;
}
