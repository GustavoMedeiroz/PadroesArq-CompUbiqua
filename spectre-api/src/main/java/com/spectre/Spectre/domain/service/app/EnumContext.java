package com.spectre.Spectre.domain.service.app;

import com.spectre.Spectre.application.core.dtos.app.EnumDto;

import java.util.List;

public interface EnumContext {

    List<EnumDto> findEnumByName(String name);

}
