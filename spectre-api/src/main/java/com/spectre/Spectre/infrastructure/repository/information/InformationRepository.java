package com.spectre.Spectre.infrastructure.repository.information;

import com.spectre.Spectre.domain.entity.information.Information;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InformationRepository extends JpaRepository<Information, Long> {
}
