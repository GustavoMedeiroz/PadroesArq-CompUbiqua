package com.spectre.Spectre.application.core.sensor;

import com.spectre.Spectre.application.core.dtos.sensor.SensorDto;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.service.sensor.SensorContext;
import com.spectre.Spectre.domain.vo.exception.exceptions.NotFoundException;
import com.spectre.Spectre.domain.vo.utils.Functions;
import com.spectre.Spectre.infrastructure.repository.sensor.SensorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class SensorService implements SensorContext {

    private static final String SENSOR_NOT_FOUND = "Sensor não encontrado";

    private final SensorRepository sensorRepository;

    @Override
    public Page<Sensor> findAll(Pageable pageable) {
        return this.sensorRepository.findAll(pageable);
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
    public void update(SensorDto sensorToUpdate) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(sensorToUpdate.getId()) && this.existsById(sensorToUpdate.getId()),
                () -> new NotFoundException(SENSOR_NOT_FOUND)
        );

        Sensor savedSensor = this.findById(sensorToUpdate.getId());

        this.mapSensorToUpdate(sensorToUpdate, savedSensor);

        this.sensorRepository.save(savedSensor);
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

    private void mapSensorToUpdate(SensorDto sensorToUpdate, Sensor savedSensor) {
        savedSensor.setName(sensorToUpdate.getName());
        savedSensor.setCurrentValue(sensorToUpdate.getCurrentValue());
        savedSensor.setType(sensorToUpdate.getType());
        savedSensor.setStatus(sensorToUpdate.getStatus());
    }
}
