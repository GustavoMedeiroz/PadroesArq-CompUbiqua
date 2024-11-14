package com.spectre.Spectre.application.core.user;

import com.spectre.Spectre.domain.service.user.UserContext;
import com.spectre.Spectre.infrastructure.repository.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService implements UserContext {

    private final UserRepository userRepository;
}
