package com.spectre.Spectre.domain.service.sensor;

import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import com.spectre.Spectre.domain.entity.sensor.Sensor;

public interface SensorContext {

    Sensor findById(Long id);

    Sensor create(SensorDto sensorDto);

    void update(SensorDto sensorDto);

    void delete(Long id);
}
