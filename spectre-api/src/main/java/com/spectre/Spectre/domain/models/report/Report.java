package com.spectre.Spectre.domain.models.report;

import com.spectre.Spectre.infrastructure.base.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "spectre_report")
@Entity
public class Report extends BaseEntity {
}
