package com.spectre.Spectre.presentation.persona;

import com.spectre.Spectre.application.core.dtos.persona.PersonaDto;
import com.spectre.Spectre.domain.entity.persona.Persona;
import com.spectre.Spectre.domain.service.persona.PersonaContext;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/persona")
@RequiredArgsConstructor
public class PersonaResource {

    private final PersonaContext personaService;

    @GetMapping(value = "/{id}")
    public ResponseEntity<Persona> findPersonaById(@PathVariable Long id) {
        Persona persona = this.personaService.findById(id);
        return ResponseEntity.ok(persona);
    }

    @PostMapping
    public ResponseEntity<Persona> create(
            @RequestBody @Valid PersonaDto personaDto,
            UriComponentsBuilder uriBuilder
    ) {
        Persona persona = this.personaService.create(personaDto);
        var uri = uriBuilder.path("/persona/{id}").buildAndExpand(persona.getId()).toUri();

        return ResponseEntity.created(uri).body(persona);
    }

    @PutMapping
    public ResponseEntity<Persona> update(@RequestBody @Valid PersonaDto personaDto) {
        this.personaService.update(personaDto);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Persona> delete(@PathVariable Long id) {
        this.personaService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
