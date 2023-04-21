package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.community.Community;
import com.sooaz.gpt.domain.community.CommunityMapper;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class CommunityPostRepository {
    private final CommunityMapper communityMapper;


    public Community save(Community community) {
        if (community.getId() == null) {
            communityMapper.save(community);
        } else {
            communityMapper.update(community);
        }
        return community;
    }

    public Optional<Community> findById(Long id) {
        return Optional.ofNullable(communityMapper.findById(id));
    }
    public List<Community> findAll(String search) {return communityMapper.findAll(search);}
    public List<Community> findByUserId(Long userId) {
        return communityMapper.findByUserId(userId);
    }
    public List<Community> findBookmarksByUserId(Long userId){
        return communityMapper.findBookmarksByUserId(userId);
    }
    public void deleteById(Long id) {
        communityMapper.delete(id);}
}

