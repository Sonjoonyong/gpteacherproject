package com.sooaz.gpt.domain.admin.notice;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeRepository noticeRepository;

    public List<Notice> getAllNotices(String search) {
        return noticeRepository.findAll(search);
    }

    public Notice getNoticeById(Long id) {
        return noticeRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("공지를 찾을 수 없습니다."));
    }

    public Notice createNotice(NoticeCreateDto noticeCreateDto) {
        Notice notice = new Notice();
        notice.setUserId(noticeCreateDto.getUserId());
        notice.setNoticeTitle(noticeCreateDto.getNoticeTitle());
        notice.setNoticeContent(noticeCreateDto.getNoticeContent());
        return noticeRepository.save(notice);
    }

    public Notice updateNotice(Long id, Notice notice) {
        Notice existingNotice = getNoticeById(id);
        notice.setId(id);
        notice.setUserId(existingNotice.getUserId());
        notice.setNoticeHit(existingNotice.getNoticeHit());
        notice.setNoticeLike(existingNotice.getNoticeLike());
        return noticeRepository.save(notice);
    }


    public void deleteNotice(Long id) {
        noticeRepository.deleteById(id);
    }
}
