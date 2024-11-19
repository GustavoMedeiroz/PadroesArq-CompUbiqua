package com.spectre.Spectre.domain.service.user;

import com.spectre.Spectre.application.core.dtos.user.UserDto;
import com.spectre.Spectre.domain.entity.user.User;

public interface UserContext {

    User findUserById(Long id);

    User create(UserDto user);

    void update(UserDto user);

    void delete(Long id);
}
