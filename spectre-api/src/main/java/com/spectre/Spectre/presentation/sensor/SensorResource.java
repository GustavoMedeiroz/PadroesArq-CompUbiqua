package com.spectre.Spectre.presentation.sensor;

import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.service.sensor.SensorContext;
import com.spectre.Spectre.domain.vo.enums.SensorType;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@RestController
@RequestMapping("sensor")
@RequiredArgsConstructor
public class SensorResource {

    private final SensorContext sensorService;

    @GetMapping
    public ResponseEntity<Page<Sensor>> findAll(
            @PageableDefault(sort = {"id"}) Pageable pageable,
            @RequestParam(required = false) String types
    ) {
        List<SensorType> typeList = notNullAndNotEmptyValue(types)
                ? Arrays.stream(types.split(","))
                    .map(String::trim)
                    .map(SensorType::valueOf)
                    .collect(Collectors.toList())
                : null;

        Page<Sensor> sensors = this.sensorService.findAllByType(pageable, typeList);
        return ResponseEntity.ok(sensors);
    }

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
