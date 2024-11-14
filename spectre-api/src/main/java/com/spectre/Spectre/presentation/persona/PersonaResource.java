package com.spectre.Spectre.presentation.persona;

import com.spectre.Spectre.domain.service.persona.PersonaContext;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/persona")
@RequiredArgsConstructor
public class PersonaResource {

    private final PersonaContext personaService;
}
