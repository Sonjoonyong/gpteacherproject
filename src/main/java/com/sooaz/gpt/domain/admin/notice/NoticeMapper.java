package com.sooaz.gpt.domain.admin.notice;

import java.util.List;

public interface NoticeMapper {

    List<Notice> findAll();

    Notice findById(Long id);

    void save(Notice notice);

    void update(Notice notice);

    void deleteById(Long id);
}
