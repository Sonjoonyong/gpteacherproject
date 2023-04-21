package com.sooaz.gpt.domain.admin.faq;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FaqService {

    private final FaqRepository faqRepository;
    private final UserRepository userRepository;

    public List<Faq> getAllFaqs(String search) {
        return faqRepository.findAll(search);
    }

    public Faq getFaqById(Long id) {
        Faq faq = faqRepository.findById(id).get();
        User user = userRepository.findById(faq.getUserId()).get();
        faq.setUserNickname(user.getUserNickname());
        return faq;
    }

    public Faq createFaq(FaqCreateDto faqCreateDto) {
        Faq faq = new Faq();
        faq.setUserId(faqCreateDto.getUserId());
        faq.setFaqTitle(faqCreateDto.getFaqTitle());
        faq.setFaqContent(faqCreateDto.getFaqContent());
        faq.setFaqCategory(faqCreateDto.getFaqCategory());
        return faqRepository.save(faq);
    }

    public Faq updateFaq(Long id, Faq faq) {
        Faq existingFaq = getFaqById(id);
        faq.setId(id);
        faq.setUserId(existingFaq.getUserId());
        return faqRepository.save(faq);
    }


    public void deleteFaq(Long id) {
        faqRepository.deleteById(id);
    }
}
