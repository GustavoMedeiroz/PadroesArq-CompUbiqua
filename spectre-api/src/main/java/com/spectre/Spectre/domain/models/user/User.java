package com.spectre.Spectre.domain.models.user;

import com.spectre.Spectre.domain.models.persona.Persona;
import com.spectre.Spectre.infrastructure.base.BaseEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "spectre_user")
@Entity
public class User extends BaseEntity {

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(name = "role")
    private String role;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "persona_id", referencedColumnName = "id", updatable = false)
    private Persona persona;
}
