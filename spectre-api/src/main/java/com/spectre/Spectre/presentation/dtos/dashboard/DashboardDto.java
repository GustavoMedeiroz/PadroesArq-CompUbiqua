package com.spectre.Spectre.presentation.dtos.dashboard;

import com.spectre.Spectre.domain.models.dashboard.Dashboard;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.presentation.dtos.information.InformationDto;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class DashboardDto extends BaseEntityDto<Dashboard> {

    private String title;
    private List<InformationDto> informationList;

    @Override
    public Dashboard mapDtoToEntity() {
        Dashboard dashboard = new Dashboard();

        dashboard.setId(this.getId());
        dashboard.setTitle(this.getTitle());
        dashboard.setInformationList(
                this.getInformationList()
                        .stream()
                        .map(InformationDto::mapDtoToEntity)
                        .toList()
        );
        dashboard.setCreatedAt(this.getCreatedAt());
        dashboard.setUpdatedAt(this.getUpdatedAt());

        return dashboard;
    }
}
