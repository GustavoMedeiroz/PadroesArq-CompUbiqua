package com.spectre.Spectre.application.core.app;

import com.spectre.Spectre.domain.vo.enums.*;
import com.spectre.Spectre.application.core.dtos.app.EnumDto;
import com.spectre.Spectre.domain.service.app.EnumContext;
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
