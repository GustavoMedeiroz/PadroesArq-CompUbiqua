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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class InformationService implements InformationContext {

    private static final String INFORMATION_NOT_FOUND = "Informação não encontrada";
    private static final String SENSOR_NOT_INFORMED = "Sensor não informado";

    private final InformationRepository informationRepository;
    private final SensorContext sensorService;

    @Override
    public Page<Information> findAll(Pageable pageable) {
        return this.informationRepository.findAll(pageable);
    }

    @Override
    public Information findById(Long id) {
        return this.informationRepository.findById(id).orElseThrow(() -> new NotFoundException(INFORMATION_NOT_FOUND));
    }

    @Override
    @Transactional
    public Information create(InformationDto informationDto) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(informationDto.getSensorId()),
                () -> new BadRequestException(SENSOR_NOT_INFORMED)
        );

        Information information = informationDto.mapDtoToEntity();
        Sensor sensor = this.sensorService.findById(informationDto.getSensorId());
        information.setSensor(sensor);
        return this.informationRepository.save(information);
    }

    @Override
    @Transactional
    public void update(InformationDto information) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(information.getId()) && this.existsById(information.getId()),
                () -> new NotFoundException(INFORMATION_NOT_FOUND)
        );

        Information informationToUpdate = this.findById(information.getId());

        this.mapInformationToUpdate(information, informationToUpdate);

        this.informationRepository.save(informationToUpdate);
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

    private void mapInformationToUpdate(InformationDto information, Information informationToUpdate) {
        informationToUpdate.setTitle(information.getTitle());
        informationToUpdate.setType(information.getType());
        informationToUpdate.setPriority(information.getPriority());

        Functions.ifPresent(
                information.getSensorId(),
                sensorId -> informationToUpdate.setSensor(this.sensorService.findById(sensorId))
        );
    }
}
