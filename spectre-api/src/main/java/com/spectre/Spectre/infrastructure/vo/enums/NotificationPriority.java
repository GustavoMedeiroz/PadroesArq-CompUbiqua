package com.spectre.Spectre.infrastructure.vo.enums;

import com.spectre.Spectre.presentation.dtos.app.EnumDto;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;

@Getter
public enum NotificationPriority {

    NORMAL("Normal"),
    URGENT("Urgente"),
    LOW("Baixa");

    private final String description;

    NotificationPriority(String description) {
        this.description = description;
    }

    public static List<EnumDto> buildEnumDto() {
        return Arrays.stream(NotificationPriority.values())
                .map(notificationPriority -> new EnumDto(notificationPriority.name(), notificationPriority.getDescription()))
                .toList();
    }
}
