package com.spectre.Spectre.domain.service.information;

import com.spectre.Spectre.application.core.dtos.information.InformationDto;
import com.spectre.Spectre.domain.entity.information.Information;

public interface InformationContext {

    Information findById(Long id);

    Information create(InformationDto informationDto);

    void update(InformationDto informationDto);

    void delete(Long id);
}
