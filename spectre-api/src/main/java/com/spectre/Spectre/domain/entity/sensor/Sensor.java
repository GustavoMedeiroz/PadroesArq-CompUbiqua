package com.spectre.Spectre.domain.entity.sensor;

import com.spectre.Spectre.domain.vo.base.BaseEntity;
import com.spectre.Spectre.domain.vo.enums.SensorStatus;
import com.spectre.Spectre.domain.vo.enums.SensorType;
import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
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

}
