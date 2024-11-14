package com.spectre.Spectre.domain.vo.enums;

import com.spectre.Spectre.application.core.dtos.app.EnumDto;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;

@Getter
public enum UserRole {

    OWNER("Proprietário"),
    MANAGER("Gerente");

    private final String description;

    UserRole(String description) {
        this.description = description;
    }

    public static List<EnumDto> buildEnumDto() {
        return Arrays.stream(UserRole.values())
                .map(userRole -> new EnumDto(userRole.name(), userRole.getDescription()))
                .toList();
    }
}
