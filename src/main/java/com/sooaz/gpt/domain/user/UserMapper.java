package com.sooaz.gpt.domain.user;

import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface UserMapper {

    void save(User user);

    Optional<User> findById(Long userId);
}
