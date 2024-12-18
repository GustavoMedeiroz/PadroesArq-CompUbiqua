package com.spectre.Spectre.domain.entity.sensor;

import com.spectre.Spectre.domain.vo.base.BaseEntity;
import com.spectre.Spectre.domain.vo.enums.SensorStatus;
import com.spectre.Spectre.domain.vo.enums.SensorType;
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
    private Double currentValue;

    @Column(name = "min_value")
    private Double minValue;

    @Column(name = "max_value")
    private Double maxValue;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private SensorType type;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private SensorStatus status;

}
