package com.spectre.Spectre.presentation.user;

import com.spectre.Spectre.application.core.dtos.user.UserDto;
import com.spectre.Spectre.domain.entity.user.User;
import com.spectre.Spectre.domain.service.user.UserContext;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("user")
@RequiredArgsConstructor
public class UserResource {

    private final UserContext userService;

    @GetMapping(value = "/all")
    public ResponseEntity<Page<User>> findAll(@PageableDefault(sort = { "id" }) Pageable pageable) {
        Page<User> userPage = this.userService.findAll(pageable);
        return ResponseEntity.ok(userPage);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<User> findUserById(@PathVariable Long id) {
        User user = this.userService.findUserById(id);
        return ResponseEntity.ok(user);
    }

    @PostMapping
    public ResponseEntity<User> create(
            @RequestBody @Valid UserDto userDto,
            UriComponentsBuilder uriBuilder
    ) {
        User user = this.userService.create(userDto);
        var uri = uriBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri();

        return ResponseEntity.created(uri).body(user);
    }

    @PutMapping
    public ResponseEntity<User> update(@RequestBody @Valid UserDto userDto) {
        this.userService.update(userDto);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<User> delete(@PathVariable Long id) {
        this.userService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
