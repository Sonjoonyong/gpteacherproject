package com.sooaz.gpt.domain.admin.faq;


import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FaqMapper {
    List<Faq> findAll(@Param("search") String search);

    Faq findById(Long id);

    void save(Faq faq);

    void update(Faq faq);

    void deleteById(Long id);
}
