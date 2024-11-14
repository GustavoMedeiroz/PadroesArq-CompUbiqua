package com.spectre.Spectre.application.core.information;

import com.spectre.Spectre.domain.service.information.InformationContext;
import com.spectre.Spectre.infrastructure.repository.information.InformationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class InformationService implements InformationContext {

    private final InformationRepository informationRepository;
}
