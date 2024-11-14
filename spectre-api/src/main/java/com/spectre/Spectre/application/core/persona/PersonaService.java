package com.spectre.Spectre.application.core.persona;

import com.spectre.Spectre.domain.service.persona.PersonaContext;
import com.spectre.Spectre.infrastructure.repository.persona.PersonaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PersonaService implements PersonaContext {

    private final PersonaRepository personaRepository;
}
