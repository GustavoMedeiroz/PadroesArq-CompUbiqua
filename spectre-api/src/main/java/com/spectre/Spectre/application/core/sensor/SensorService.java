package com.spectre.Spectre.application.core.sensor;

import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.service.sensor.SensorContext;
import com.spectre.Spectre.domain.vo.enums.SensorType;
import com.spectre.Spectre.domain.vo.exception.NotFoundException;
import com.spectre.Spectre.domain.vo.utils.Functions;
import com.spectre.Spectre.infrastructure.repository.sensor.SensorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class SensorService implements SensorContext {

    private static final String SENSOR_NOT_FOUND = "Sensor não encontrado";

    private final SensorRepository sensorRepository;

    @Override
    public Page<Sensor> findAllByType(Pageable pageable, List<SensorType> types) {
        return this.sensorRepository.findAllByType(types, pageable);
    }

    @Override
    public Sensor findById(Long id) {
        return this.sensorRepository.findById(id).orElseThrow(() -> new NotFoundException(SENSOR_NOT_FOUND));
    }

    @Override
    @Transactional
    public Sensor create(SensorDto sensorDto) {
        Sensor sensor = sensorDto.mapDtoToEntity();
        return this.sensorRepository.save(sensor);
    }

    @Override
    @Transactional
    public void update(SensorDto sensor) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(sensor.getId()) && this.existsById(sensor.getId()),
                () -> new NotFoundException(SENSOR_NOT_FOUND)
        );

        Sensor sensorToUpdate = this.findById(sensor.getId());

        this.mapSensorToUpdate(sensor, sensorToUpdate);

        this.sensorRepository.save(sensorToUpdate);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Functions.acceptFalseThrows(
                this.existsById(id),
                () -> new NotFoundException(SENSOR_NOT_FOUND)
        );
        this.sensorRepository.deleteById(id);
    }

    private Boolean existsById(Long id) {
        return this.sensorRepository.existsById(id);
    }

    private void mapSensorToUpdate(SensorDto sensor, Sensor sensorToUpdate) {
        sensorToUpdate.setName(sensor.getName());
        sensorToUpdate.setCurrentValue(sensor.getCurrentValue());
        sensorToUpdate.setMinValue(sensor.getMinValue());
        sensorToUpdate.setMaxValue(sensor.getMaxValue());
        sensorToUpdate.setType(sensor.getType());
        sensorToUpdate.setStatus(sensor.getStatus());
    }
}
