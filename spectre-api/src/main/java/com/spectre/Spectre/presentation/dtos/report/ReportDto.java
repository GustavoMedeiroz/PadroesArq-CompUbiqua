package com.spectre.Spectre.presentation.dtos.report;

import com.spectre.Spectre.domain.models.report.Report;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.presentation.dtos.financial.FinancialDto;
import com.spectre.Spectre.presentation.dtos.sensor.SensorDto;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ReportDto extends BaseEntityDto<Report> {

    private List<FinancialDto> financials;
    private List<SensorDto> sensors;

    @Override
    public Report mapDtoToEntity() {
        Report report = new Report();

        report.setId(this.getId());
        report.setFinancials(
                this.getFinancials()
                        .stream()
                        .map(FinancialDto::mapDtoToEntity)
                        .toList()
        );
        report.setSensors(
                this.getSensors()
                        .stream()
                        .map(SensorDto::mapDtoToEntity)
                        .toList()
        );
        report.setCreatedAt(this.getCreatedAt());
        report.setUpdatedAt(this.getUpdatedAt());

        return report;
    }
}
