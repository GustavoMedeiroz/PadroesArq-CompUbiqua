package com.spectre.Spectre.infrastructure.vo.enums;

import com.spectre.Spectre.presentation.dtos.app.EnumDto;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;

@Getter
public enum SensorStatus {

    ACTIVE("Ativo"),
    INACTIVE("Inativo");

    private final String description;

    SensorStatus(String description) {
        this.description = description;
    }

    public static List<EnumDto> buildEnumDto() {
        return Arrays.stream(SensorStatus.values())
                .map(sensorStatus -> new EnumDto(sensorStatus.name(), sensorStatus.getDescription()))
                .toList();
    }
}
