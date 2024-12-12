package com.spectre.Spectre.application.core.persona;

import com.spectre.Spectre.application.core.dtos.persona.PersonaDto;
import com.spectre.Spectre.domain.entity.persona.Persona;
import com.spectre.Spectre.domain.service.persona.PersonaContext;
import com.spectre.Spectre.domain.vo.exception.NotFoundException;
import com.spectre.Spectre.domain.vo.utils.Functions;
import com.spectre.Spectre.infrastructure.repository.persona.PersonaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class PersonaService implements PersonaContext {

    private static final String PERSONA_NOT_FOUND = "Pessoa não encontrada";

    private final PersonaRepository personaRepository;

    @Override
    public Page<Persona> findAll(Pageable pageable) {
        return this.personaRepository.findAll(pageable);
    }

    @Override
    public Persona findById(Long id) {
        return this.personaRepository.findById(id).orElseThrow(() -> new NotFoundException(PERSONA_NOT_FOUND));
    }

    @Override
    @Transactional
    public Persona create(PersonaDto personaDto) {
        Persona persona = personaDto.mapDtoToEntity();
        return this.personaRepository.save(persona);
    }

    @Override
    @Transactional
    public void update(PersonaDto persona) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(persona.getId()) && this.existsById(persona.getId()),
                () -> new NotFoundException(PERSONA_NOT_FOUND)
        );

        Persona personaToUpdate = this.findById(persona.getId());

        this.mapPersonaToUpdate(persona, personaToUpdate);

        this.personaRepository.save(personaToUpdate);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Functions.acceptFalseThrows(
                this.existsById(id),
                () -> new NotFoundException(PERSONA_NOT_FOUND)
        );
        this.personaRepository.deleteById(id);
    }

    @Override
    public Boolean existsById(Long id) {
        return this.personaRepository.existsById(id);
    }

    private void mapPersonaToUpdate(PersonaDto persona, Persona personaToUpdate) {
        personaToUpdate.setName(persona.getName());
        personaToUpdate.setTaxId(persona.getTaxId());
        personaToUpdate.setPhone(persona.getPhone());
    }
}
