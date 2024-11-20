package com.spectre.Spectre.domain.service.user;

import com.spectre.Spectre.application.core.dtos.user.UserDto;
import com.spectre.Spectre.domain.entity.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface UserContext {

    Page<User> findAll(Pageable pageable);

    User findUserById(Long id);

    User create(UserDto user);

    void update(UserDto user);

    void delete(Long id);
}
