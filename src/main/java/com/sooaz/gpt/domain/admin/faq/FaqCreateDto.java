package com.sooaz.gpt.domain.admin.faq;

import lombok.Data;

@Data
public class FaqCreateDto {
    private Long userId;
    private String faqTitle;
    private String faqContent;
    private String faqCategory;
}
