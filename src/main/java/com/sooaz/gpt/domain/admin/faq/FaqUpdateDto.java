package com.sooaz.gpt.domain.admin.faq;

import lombok.Data;

@Data
public class FaqUpdateDto {
    private Long id;
    private Long userId;
    private String faqTitle;
    private String faqContent;
    private String faqCategory;
}
