package com.spectre.Spectre.domain.services.app;

import com.spectre.Spectre.infrastructure.vo.enums.UserRole;
import com.spectre.Spectre.presentation.dtos.app.EnumDto;
import com.spectre.Spectre.presentation.services.app.EnumContext;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnumService implements EnumContext {

    @Override
    public List<EnumDto> findEnumByName(String name) {
        return switch (name) {
            case "userRole" -> UserRole.buildEnumDto();
            default -> null;
        };
    }
}
