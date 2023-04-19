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
        return noticeRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Notice not found"));
    }

    public Notice createNotice(NoticeCreateDto noticeCreateDto) {
        Notice notice = new Notice();
        notice.setUserId(noticeCreateDto.getUserId());
        notice.setNoticeTitle(noticeCreateDto.getNoticeTitle());
        notice.setNoticeContent(noticeCreateDto.getNoticeContent());
        return noticeRepository.save(notice);
    }

    public Notice updateNotice(Long id, NoticeUpdateDto noticeUpdateDto) {
        Notice notice = getNoticeById(id);
        notice.setUserId(noticeUpdateDto.getUserId());
        notice.setNoticeTitle(noticeUpdateDto.getNoticeTitle());
        notice.setNoticeContent(noticeUpdateDto.getNoticeContent());
        notice.setNoticeHit(noticeUpdateDto.getNoticeHit());
        notice.setNoticeLike(noticeUpdateDto.getNoticeLike());
        return noticeRepository.save(notice);
    }

    public void deleteNotice(Long id) {
        noticeRepository.deleteById(id);
    }
}
