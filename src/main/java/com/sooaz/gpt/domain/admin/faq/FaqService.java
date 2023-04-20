package com.sooaz.gpt.domain.admin.faq;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FaqService {

    private final FaqRepository faqRepository;

    public List<Faq> getAllFaqs(String search) {
        return faqRepository.findAll(search);
    }

    public Faq getFaqById(Long id) {
        return faqRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("공지를 찾을 수 없습니다."));
    }

    public Faq createFaq(FaqCreateDto faqCreateDto) {
        Faq faq = new Faq();
        faq.setUserId(faqCreateDto.getUserId());
        faq.setFaqTitle(faqCreateDto.getFaqTitle());
        faq.setFaqContent(faqCreateDto.getFaqContent());
        return faqRepository.save(faq);
    }

    public Faq updateFaq(Long id, Faq faq) {
        Faq existingFaq = getFaqById(id);
        faq.setId(id);
        faq.setUserId(existingFaq.getUserId());
        faq.setFaqTitle(existingFaq.getFaqTitle());
        faq.setFaqContent(existingFaq.getFaqContent());
        return faqRepository.save(faq);
    }


    public void deleteFaq(Long id) {
        faqRepository.deleteById(id);
    }
}
