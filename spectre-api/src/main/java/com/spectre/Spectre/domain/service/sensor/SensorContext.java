package com.spectre.Spectre.domain.service.sensor;

import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.vo.enums.SensorType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface SensorContext {

    Page<Sensor> findAllByType(Pageable pageable, List<SensorType> type);

    Sensor findById(Long id);

    Sensor create(SensorDto sensorDto);

    void update(SensorDto sensorDto);

    void delete(Long id);

}
