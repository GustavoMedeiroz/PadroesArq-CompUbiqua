package com.spectre.Spectre.application.core.dtos.persona;

import com.spectre.Spectre.domain.entity.persona.Persona;
import com.spectre.Spectre.domain.vo.base.BaseEntityDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PersonaDto extends BaseEntityDto<Persona> {

    private String name;
    private String taxId;
    private String phone;

    @Override
    public Persona mapDtoToEntity() {
        Persona persona = new Persona();

        persona.setId(this.getId());
        persona.setName(this.getName());
        persona.setTaxId(this.getTaxId());
        persona.setPhone(this.getPhone());
        persona.setCreatedAt(this.getCreatedAt());
        persona.setUpdatedAt(this.getUpdatedAt());

        return persona;
    }
}