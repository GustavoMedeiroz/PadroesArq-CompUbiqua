package com.spectre.Spectre.domain.vo.enums;

import com.spectre.Spectre.application.core.dtos.app.EnumDto;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;

@Getter
public enum SensorType {

    WEIGHT("Peso"),
    TEMPERATURE("Temperatura"),
    HUMIDITY("Umidade"),
    MOTION("Movimento");

    private final String description;

    SensorType(String description) {
        this.description = description;
    }

    public static List<EnumDto> buildEnumDto() {
        return Arrays.stream(SensorType.values())
                .map(sensorType -> new EnumDto(sensorType.name(), sensorType.getDescription()))
                .toList();
    }
}
