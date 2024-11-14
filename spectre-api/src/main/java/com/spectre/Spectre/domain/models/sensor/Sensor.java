package com.spectre.Spectre.domain.models.sensor;

import com.spectre.Spectre.infrastructure.base.BaseEntity;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.infrastructure.vo.enums.SensorStatus;
import com.spectre.Spectre.infrastructure.vo.enums.SensorType;
import com.spectre.Spectre.presentation.dtos.sensor.SensorDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Table(name = "spectre_sensor")
@Entity
public class Sensor extends BaseEntity implements Serializable {

    @Column(name = "name")
    private String name;

    @Column(name = "current_value")
    private String currentValue;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private SensorType type;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private SensorStatus status;

    @Override
    public SensorDto mapEntityToDto() {
        SensorDto sensorDto = new SensorDto();

        sensorDto.setId(this.getId());
        sensorDto.setName(this.getName());
        sensorDto.setCurrentValue(this.getCurrentValue());
        sensorDto.setType(this.getType());
        sensorDto.setStatus(this.getStatus());
        sensorDto.setCreatedAt(this.getCreatedAt());
        sensorDto.setUpdatedAt(this.getUpdatedAt());

        return sensorDto;
    }
}
