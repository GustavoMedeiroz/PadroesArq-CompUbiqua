package com.spectre.Spectre.application.core.dtos.information;

import com.spectre.Spectre.domain.entity.information.Information;
import com.spectre.Spectre.domain.vo.base.BaseEntityDto;
import com.spectre.Spectre.domain.vo.enums.InformationType;
import com.spectre.Spectre.domain.vo.enums.NotificationPriority;
import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import lombok.Getter;
import lombok.Setter;

import java.util.Optional;

@Getter
@Setter
public class InformationDto extends BaseEntityDto<Information> {

    private String title;
    private SensorDto sensor;
    private InformationType type;
    private NotificationPriority priority;

    @Override
    public Information mapDtoToEntity() {
        Information information = new Information();

        information.setId(this.getId());
        information.setTitle(this.getTitle());
        information.setSensor(
                Optional.ofNullable(this.getSensor())
                        .map(SensorDto::mapDtoToEntity)
                        .orElse(null)
        );
        information.setType(this.getType());
        information.setPriority(this.getPriority());
        information.setCreatedAt(this.getCreatedAt());
        information.setUpdatedAt(this.getUpdatedAt());

        return information;
    }
}
