package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.admin.notice.Notice;
import com.sooaz.gpt.domain.admin.notice.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommunityPostService {
    private final CommunityPostRepository communityPostRepository;

    public List<Notice> getAllCommunity(String search) {
        return communityPostRepository.findAll(search);
    }
}
