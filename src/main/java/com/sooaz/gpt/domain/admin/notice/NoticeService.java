package com.sooaz.gpt.domain.admin.notice;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeRepository noticeRepository;

    private final UserRepository userRepository;
    public List<Notice> getAllNotices(String search) {
        return noticeRepository.findAll(search);
    }

    public Notice getNoticeById(Long id) {
        Notice notice = noticeRepository.findById(id).get();
        System.out.println(notice);
        User user = userRepository.findById(notice.getUserId()).get();
        System.out.println(user);
        notice.setUserNickname(user.getUserNickname());
        return notice;
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

    public void increaseViewCount(Long id) {
        noticeRepository.increaseViewCount(id);
    }

}
