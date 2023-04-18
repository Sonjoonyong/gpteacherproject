package com.sooaz.gpt.domain.user;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface UserMapper {

    void save(User user);

    List<User> findAll();

    Optional<User> findById(Long userId);

    Optional<User> findByLoginId(String loginId);

    Optional<User> findByNickname(String userNickname);

    void update(UserUpdateDto userUpdateDto);

    void delete(Long userId);

}
