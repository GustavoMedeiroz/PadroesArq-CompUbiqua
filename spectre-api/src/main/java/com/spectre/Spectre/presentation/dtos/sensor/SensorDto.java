package com.spectre.Spectre.presentation.dtos.sensor;

import com.spectre.Spectre.domain.models.sensor.Sensor;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.infrastructure.vo.enums.SensorStatus;
import com.spectre.Spectre.infrastructure.vo.enums.SensorType;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SensorDto extends BaseEntityDto<Sensor> {

    private String name;
    private String currentValue;
    private SensorType type;
    private SensorStatus status;

    @Override
    public Sensor mapDtoToEntity() {
        Sensor sensor = new Sensor();

        sensor.setId(this.getId());
        sensor.setName(this.getName());
        sensor.setCurrentValue(this.getCurrentValue());
        sensor.setType(this.getType());
        sensor.setStatus(this.getStatus());
        sensor.setCreatedAt(this.getCreatedAt());
        sensor.setUpdatedAt(this.getUpdatedAt());

        return sensor;
    }
}
