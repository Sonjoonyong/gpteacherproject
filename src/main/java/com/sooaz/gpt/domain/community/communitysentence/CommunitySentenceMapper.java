package com.sooaz.gpt.domain.community.communitysentence;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Optional;

@Mapper
public interface CommunitySentenceMapper {

    void save(@Param("communityPostId") long communityPostId,
              @Param("sentenceId") Long sentenceId);

    Optional<CommunitySentence> findById(@Param("communityPostId") Long communityPostId,
                            @Param("userId") Long sentenceId);

    void delete(CommunitySentence communitySentence);
}
