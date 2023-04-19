package com.sooaz.gpt.domain.admin.notice;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class NoticeRepository {

    private final NoticeMapper noticeMapper;

    public Notice save(Notice notice) {
        if (notice.getId() == null) {
            noticeMapper.save(notice);
        } else {
            noticeMapper.update(notice);
        }
        return notice;
    }

    public Optional<Notice> findById(Long id) {
        return Optional.ofNullable(noticeMapper.findById(id));
    }

    public List<Notice> findAll(String search) {
        return noticeMapper.findAll(search);
    }

    public void deleteById(Long id) {
        noticeMapper.deleteById(id);
    }
}