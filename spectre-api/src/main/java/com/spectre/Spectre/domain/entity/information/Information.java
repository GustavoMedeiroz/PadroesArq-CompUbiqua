package com.spectre.Spectre.domain.entity.information;

import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.vo.base.BaseEntity;
import com.spectre.Spectre.domain.vo.enums.InformationType;
import com.spectre.Spectre.domain.vo.enums.NotificationPriority;
import com.spectre.Spectre.application.core.dtos.information.InformationDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Optional;

@Getter
@Setter
@Table(name = "spectre_information")
@Entity
public class Information extends BaseEntity implements Serializable {

    @Column(name = "title")
    private String title;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "sensor_id", referencedColumnName = "id", updatable = false)
    private Sensor sensor;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private InformationType type;

    @Enumerated(EnumType.STRING)
    @Column(name = "priority")
    private NotificationPriority priority;

    @Override
    public InformationDto mapEntityToDto() {
        InformationDto informationDto = new InformationDto();

        informationDto.setId(this.getId());
        informationDto.setTitle(this.getTitle());
        informationDto.setSensor(
                Optional.ofNullable(this.getSensor())
                        .map(Sensor::mapEntityToDto)
                        .orElse(null)
        );
        informationDto.setType(this.getType());
        informationDto.setPriority(this.getPriority());
        informationDto.setCreatedAt(this.getCreatedAt());
        informationDto.setUpdatedAt(this.getUpdatedAt());

        return informationDto;
    }
}
