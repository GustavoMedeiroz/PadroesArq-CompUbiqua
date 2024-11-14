package com.spectre.Spectre.application.core.sensor;

import com.spectre.Spectre.domain.service.sensor.SensorContext;
import com.spectre.Spectre.infrastructure.repository.sensor.SensorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SensorService implements SensorContext {

    private final SensorRepository sensorRepository;
}
