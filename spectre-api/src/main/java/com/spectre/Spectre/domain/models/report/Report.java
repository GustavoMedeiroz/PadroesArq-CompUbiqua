package com.spectre.Spectre.domain.models.report;

import com.spectre.Spectre.domain.models.financial.Financial;
import com.spectre.Spectre.domain.models.sensor.Sensor;
import com.spectre.Spectre.infrastructure.base.BaseEntity;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.presentation.dtos.report.ReportDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Table(name = "spectre_report")
@Entity
public class Report extends BaseEntity implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "report_id")
    List<Financial> financials = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "report_id")
    List<Sensor> sensors = new ArrayList<>();

    @Override
    public ReportDto mapEntityToDto() {
        ReportDto reportDto = new ReportDto();

        reportDto.setId(this.getId());
        reportDto.setFinancials(
                this.getFinancials()
                        .stream()
                        .map(Financial::mapEntityToDto)
                        .toList()
        );
        reportDto.setSensors(
                this.getSensors()
                        .stream()
                        .map(Sensor::mapEntityToDto)
                        .toList()
        );
        reportDto.setCreatedAt(this.getCreatedAt());
        reportDto.setUpdatedAt(this.getUpdatedAt());

        return reportDto;
    }
}
