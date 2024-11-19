package com.spectre.Spectre.domain.entity.persona;

import com.spectre.Spectre.domain.vo.base.BaseEntity;
import com.spectre.Spectre.application.core.dtos.persona.PersonaDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.br.CPF;

import java.io.Serializable;

@Getter
@Setter
@Table(name = "spectre_persona")
@Entity
public class Persona extends BaseEntity implements Serializable {

    @Column(name = "name")
    private String name;

    @Column(name = "taxId")
    @CPF
    private String taxId;

    @Column(name = "phone")
    private String phone;

}
