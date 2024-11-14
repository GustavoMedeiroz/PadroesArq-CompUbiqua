package com.spectre.Spectre.presentation.user;

import com.spectre.Spectre.domain.service.user.UserContext;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserResource {

    private final UserContext userService;
}
