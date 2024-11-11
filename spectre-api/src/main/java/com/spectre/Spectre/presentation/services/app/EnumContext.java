package com.spectre.Spectre.presentation.services.app;

import com.spectre.Spectre.presentation.dtos.app.EnumDto;

import java.util.List;

public interface EnumContext {

    List<EnumDto> findEnumByName(String name);

}
