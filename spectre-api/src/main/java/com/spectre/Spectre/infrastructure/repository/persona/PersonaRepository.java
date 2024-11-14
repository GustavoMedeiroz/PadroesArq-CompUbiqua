package com.spectre.Spectre.infrastructure.repository.persona;

import com.spectre.Spectre.domain.entity.persona.Persona;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonaRepository extends JpaRepository<Persona, Long> {
}
