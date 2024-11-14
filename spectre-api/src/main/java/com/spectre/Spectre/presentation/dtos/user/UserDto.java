package com.spectre.Spectre.presentation.dtos.user;

import com.spectre.Spectre.domain.models.user.User;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.infrastructure.vo.enums.UserRole;
import com.spectre.Spectre.presentation.dtos.persona.PersonaDto;
import lombok.Getter;
import lombok.Setter;

import java.util.Optional;

@Getter
@Setter
public class UserDto extends BaseEntityDto<User> {

    private String email;
    private String password;
    private UserRole role;
    private PersonaDto persona;

    @Override
    public User mapDtoToEntity() {
        User user = new User();

        user.setId(this.getId());
        user.setEmail(this.getEmail());
        user.setPassword(this.getPassword());
        user.setRole(this.getRole());
        user.setPersona(
                Optional.ofNullable(this.getPersona())
                        .map(PersonaDto::mapDtoToEntity)
                        .orElse(null)
        );
        user.setCreatedAt(this.getCreatedAt());
        user.setUpdatedAt(this.getUpdatedAt());

        return user;
    }
}
