package com.spectre.Spectre.domain.service.persona;

import com.spectre.Spectre.application.core.dtos.persona.PersonaDto;
import com.spectre.Spectre.domain.entity.persona.Persona;

public interface PersonaContext {

    Persona findById(Long id);

    Persona create(PersonaDto personaDto);

    void update(PersonaDto personaDto);

    void delete(Long id);
}
