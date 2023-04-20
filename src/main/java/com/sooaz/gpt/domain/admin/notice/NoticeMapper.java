package com.sooaz.gpt.domain.admin.notice;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeMapper {

    List<Notice> findAll(@Param("search") String search);

    Notice findById(Long id);

    void save(Notice notice);

    void update(Notice notice);

    void deleteById(Long id);

    void increaseViewCount(Long id);

}
