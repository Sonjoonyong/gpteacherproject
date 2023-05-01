package com.sooaz.gpt.domain.community.communitysentence;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class CommunitySentenceRepository {

    private final CommunitySentenceMapper communitySentenceMapper;

    public void save(Long communityPostId, Long userId) {
        communitySentenceMapper.save(communityPostId, userId);
    }

    public Optional<CommunitySentence> findById(Long communityPostId, Long sentenceId) {
        return communitySentenceMapper.findById(communityPostId, sentenceId);
    }

    public void delete(CommunitySentence communitySentence) {
        communitySentenceMapper.delete(communitySentence);
    }

}
