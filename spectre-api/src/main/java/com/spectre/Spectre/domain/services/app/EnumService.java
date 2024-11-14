package com.spectre.Spectre.domain.services.app;

import com.spectre.Spectre.infrastructure.vo.enums.*;
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
            case "notificationPriority" -> NotificationPriority.buildEnumDto();
            case "sensorType" -> SensorType.buildEnumDto();
            case "sensorStatus" -> SensorStatus.buildEnumDto();
            case "informationType" -> InformationType.buildEnumDto();
            default -> null;
        };
    }
}
