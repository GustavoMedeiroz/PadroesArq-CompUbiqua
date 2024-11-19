package com.spectre.Spectre.application.core.information;

import com.spectre.Spectre.application.core.dtos.information.InformationDto;
import com.spectre.Spectre.domain.entity.information.Information;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.service.information.InformationContext;
import com.spectre.Spectre.domain.service.sensor.SensorContext;
import com.spectre.Spectre.domain.vo.exception.exceptions.BadRequestException;
import com.spectre.Spectre.domain.vo.exception.exceptions.NotFoundException;
import com.spectre.Spectre.domain.vo.utils.Functions;
import com.spectre.Spectre.infrastructure.repository.information.InformationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class InformationService implements InformationContext {

    private static final String INFORMATION_NOT_FOUND = "Informação não encontrada";
    private static final String SENSOR_NOT_INFORMATION = "Sensor não informado";

    private final InformationRepository informationRepository;
    private final SensorContext sensorService;

    @Override
    public Information findById(Long id) {
        return this.informationRepository.findById(id).orElseThrow(() -> new NotFoundException(INFORMATION_NOT_FOUND));
    }

    @Override
    @Transactional
    public Information create(InformationDto informationDto) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(informationDto.getSensorId()),
                () -> new BadRequestException(SENSOR_NOT_INFORMATION)
        );

        Information information = informationDto.mapDtoToEntity();
        Sensor sensor = this.sensorService.findById(informationDto.getSensorId());
        information.setSensor(sensor);
        return this.informationRepository.save(information);
    }

    @Override
    @Transactional
    public void update(InformationDto informationToUpdate) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(informationToUpdate.getId()) && this.existsById(informationToUpdate.getId()),
                () -> new NotFoundException(INFORMATION_NOT_FOUND)
        );

        Information savedInformation = this.findById(informationToUpdate.getId());

        this.mapInformationToUpdate(informationToUpdate, savedInformation);

        this.informationRepository.save(savedInformation);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Functions.acceptFalseThrows(
                this.existsById(id),
                () -> new NotFoundException(INFORMATION_NOT_FOUND)
        );
        this.informationRepository.deleteById(id);
    }

    private Boolean existsById(Long id) {
        return this.informationRepository.existsById(id);
    }

    private void mapInformationToUpdate(InformationDto informationToUpdate, Information savedInformation) {
        savedInformation.setTitle(informationToUpdate.getTitle());
        savedInformation.setType(informationToUpdate.getType());
        savedInformation.setPriority(informationToUpdate.getPriority());

        Functions.ifPresent(
                informationToUpdate.getSensorId(),
                sensorId -> savedInformation.setSensor(this.sensorService.findById(sensorId))
        );
    }
}
