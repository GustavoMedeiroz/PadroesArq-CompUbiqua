package com.spectre.Spectre.domain.entity.persona;

import com.spectre.Spectre.domain.vo.base.BaseEntity;
import com.spectre.Spectre.application.core.dtos.persona.PersonaDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Table(name = "spectre_persona")
@Entity
public class Persona extends BaseEntity implements Serializable {

    @Column(name = "name")
    private String name;

    @Column(name = "taxId")
    private String taxId;

    @Column(name = "phone")
    private String phone;

    @Override
    public PersonaDto mapEntityToDto() {
        PersonaDto personaDto = new PersonaDto();

        personaDto.setId(this.getId());
        personaDto.setName(this.getName());
        personaDto.setTaxId(this.getTaxId());
        personaDto.setPhone(this.getPhone());
        personaDto.setCreatedAt(this.getCreatedAt());
        personaDto.setUpdatedAt(this.getUpdatedAt());

        return personaDto;
    }
}