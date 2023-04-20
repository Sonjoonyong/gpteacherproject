package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.community.Community;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningUpdateDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface CommunityMapper {
    void save(Community community);

    Community findById(Long Id);

    List<Community> findAll(@Param("search") String search);

    List<Community> findByUserId(Long userId);

    List<Community> findBookmarksByUserId(Long userId);

    void update(CommunityUpdateDto communityUpdateDto);

    void delete(Long Id);

}
