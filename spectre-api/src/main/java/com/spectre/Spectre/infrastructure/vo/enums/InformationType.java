package com.spectre.Spectre.infrastructure.vo.enums;

import com.spectre.Spectre.presentation.dtos.app.EnumDto;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;

@Getter
public enum InformationType {

    NOTIFICATION("Notificação"),
    METRIC("Métrica"),
    ALERT("Alerta");

    private final String description;

    InformationType(String description) {
        this.description = description;
    }

    public static List<EnumDto> buildEnumDto() {
        return Arrays.stream(InformationType.values())
                .map(informationType -> new EnumDto(informationType.name(), informationType.getDescription()))
                .toList();
    }
}
