package com.spectre.Spectre.domain.service.persona;

import com.spectre.Spectre.application.core.dtos.persona.PersonaDto;
import com.spectre.Spectre.domain.entity.persona.Persona;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PersonaContext {

    Page<Persona> findAll(Pageable pageable);

    Persona findById(Long id);

    Persona create(PersonaDto personaDto);

    void update(PersonaDto personaDto);

    void delete(Long id);

    Boolean existsById(Long id);
}
