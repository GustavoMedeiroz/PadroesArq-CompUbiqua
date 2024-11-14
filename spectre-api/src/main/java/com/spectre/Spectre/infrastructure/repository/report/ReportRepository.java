package com.spectre.Spectre.infrastructure.repository.report;

import com.spectre.Spectre.domain.entity.report.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long> {
}
