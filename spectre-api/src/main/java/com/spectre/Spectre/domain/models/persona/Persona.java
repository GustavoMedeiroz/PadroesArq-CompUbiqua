package com.spectre.Spectre.domain.models.persona;

import com.spectre.Spectre.domain.models.user.User;
import com.spectre.Spectre.infrastructure.base.BaseEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "spectre_persona")
@Entity
public class Persona extends BaseEntity {

    @Column(name = "name")
    private String name;

    @Column(name = "taxId")
    private String taxId;

    @Column(name = "phone")
    private String phone;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "user_id", referencedColumnName = "id", updatable = false)
    private User user;

}
