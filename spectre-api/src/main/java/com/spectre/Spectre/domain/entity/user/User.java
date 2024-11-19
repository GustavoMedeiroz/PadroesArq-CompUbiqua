package com.spectre.Spectre.domain.entity.user;

import com.spectre.Spectre.domain.entity.persona.Persona;
import com.spectre.Spectre.domain.vo.base.BaseEntity;
import com.spectre.Spectre.domain.vo.enums.UserRole;
import com.spectre.Spectre.application.core.dtos.user.UserDto;
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

}
