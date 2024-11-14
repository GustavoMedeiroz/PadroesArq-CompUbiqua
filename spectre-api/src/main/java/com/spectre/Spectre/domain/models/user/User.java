package com.spectre.Spectre.domain.models.user;

import com.spectre.Spectre.domain.models.persona.Persona;
import com.spectre.Spectre.infrastructure.base.BaseEntity;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.infrastructure.vo.enums.UserRole;
import com.spectre.Spectre.presentation.dtos.user.UserDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Optional;

@Getter
@Setter
@Table(name = "spectre_user")
@Entity
public class User extends BaseEntity implements Serializable {

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(name = "role")
    private UserRole role;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "persona_id", referencedColumnName = "id", updatable = false)
    private Persona persona;

    @Override
    public UserDto mapEntityToDto() {
        UserDto userDto = new UserDto();

        userDto.setId(this.getId());
        userDto.setEmail(this.getEmail());
        userDto.setPassword(this.getPassword());
        userDto.setRole(this.getRole());
        userDto.setPersona(
                Optional.ofNullable(this.getPersona())
                        .map(Persona::mapEntityToDto)
                        .orElse(null)
        );
        userDto.setCreatedAt(this.getCreatedAt());
        userDto.setUpdatedAt(this.getUpdatedAt());

        return userDto;
    }
}
