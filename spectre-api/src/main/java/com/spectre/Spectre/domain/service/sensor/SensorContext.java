package com.spectre.Spectre.domain.service.sensor;

import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface SensorContext {

    Page<Sensor> findAll(Pageable pageable);

    Sensor findById(Long id);

    Sensor create(SensorDto sensorDto);

    void update(SensorDto sensorDto);

    void delete(Long id);
}
