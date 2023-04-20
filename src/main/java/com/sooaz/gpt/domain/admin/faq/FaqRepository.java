package com.sooaz.gpt.domain.admin.faq;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class FaqRepository {
    private final FaqMapper faqMapper;

    public Faq save(Faq faq){
        if(faq.getId() == null){
            faqMapper.save(faq);
        } else {
            faqMapper.update(faq);
        }
        return faq;
    }

    public Optional<Faq> findById(Long id){
        return Optional.ofNullable(faqMapper.findById(id));
    }
    public List<Faq> findAll(String search){
        return faqMapper.findAll(search);
    }

    public void deleteById(Long id){
        faqMapper.deleteById(id);
    }
}
