package com.spectre.Spectre.domain.models.dashboard;

import com.spectre.Spectre.domain.models.information.Information;
import com.spectre.Spectre.infrastructure.base.BaseEntity;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import com.spectre.Spectre.presentation.dtos.dashboard.DashboardDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@Table(name = "spectre_dashboard")
@Entity
public class Dashboard extends BaseEntity implements Serializable {

    @Column(name = "title")
    private String title;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "dashboard_id")
    private List<Information> informationList;

    @Override
    public DashboardDto mapEntityToDto() {
        DashboardDto dashboardDto = new DashboardDto();

        dashboardDto.setId(this.getId());
        dashboardDto.setTitle(this.getTitle());
        dashboardDto.setInformationList(
                this.getInformationList()
                        .stream()
                        .map(Information::mapEntityToDto)
                        .toList()
        );
        dashboardDto.setCreatedAt(this.getCreatedAt());
        dashboardDto.setUpdatedAt(this.getUpdatedAt());

        return dashboardDto;
    }
}
