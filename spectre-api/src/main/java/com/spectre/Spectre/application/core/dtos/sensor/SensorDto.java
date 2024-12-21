package com.spectre.Spectre.application.core.dtos.sensor;

import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.vo.base.BaseEntityDto;
import com.spectre.Spectre.domain.vo.enums.SensorStatus;
import com.spectre.Spectre.domain.vo.enums.SensorType;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SensorDto extends BaseEntityDto<Sensor> {

    private String name;
    private Double minValue;
    private Double maxValue;
    private Double currentValue;
    private SensorType type;
    private SensorStatus status;

    @Override
    public Sensor mapDtoToEntity() {
        Sensor sensor = new Sensor();

        sensor.setId(this.getId());
        sensor.setName(this.getName());
        sensor.setCurrentValue(this.getCurrentValue());
        sensor.setMinValue(this.getMinValue());
        sensor.setMaxValue(this.getMaxValue());
        sensor.setType(this.getType());
        sensor.setStatus(this.getStatus());
        sensor.setCreatedAt(this.getCreatedAt());
        sensor.setUpdatedAt(this.getUpdatedAt());

        return sensor;
    }
}
