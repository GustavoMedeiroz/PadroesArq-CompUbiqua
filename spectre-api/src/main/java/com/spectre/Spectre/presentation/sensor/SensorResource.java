package com.spectre.Spectre.presentation.sensor;

import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.service.sensor.SensorContext;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/sensor")
@RequiredArgsConstructor
public class SensorResource {

    private final SensorContext sensorService;

    @GetMapping(value = "/{id}")
    public ResponseEntity<Sensor> findById(@PathVariable Long id) {
        Sensor sensor = this.sensorService.findById(id);
        return ResponseEntity.ok(sensor);
    }

    @PostMapping
    public ResponseEntity<Sensor> create(
            @RequestBody @Valid SensorDto sensorDto,
            UriComponentsBuilder uriBuilder
    ) {
        Sensor createdSensor = this.sensorService.create(sensorDto);
        var uri = uriBuilder.path("/sensor/{id}").buildAndExpand(createdSensor.getId()).toUri();
        return ResponseEntity.created(uri).body(createdSensor);
    }

    @PutMapping
    public ResponseEntity<Sensor> update(@RequestBody SensorDto sensorDto) {
        this.sensorService.update(sensorDto);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Sensor> delete(@PathVariable Long id) {
        this.sensorService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
