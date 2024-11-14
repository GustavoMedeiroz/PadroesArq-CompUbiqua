package com.spectre.Spectre.presentation.sensor;

import com.spectre.Spectre.domain.service.sensor.SensorContext;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sensor")
@RequiredArgsConstructor
public class SensorResource {

    private final SensorContext sensorService;
}
