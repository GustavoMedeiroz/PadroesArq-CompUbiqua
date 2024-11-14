package com.spectre.Spectre.application.core.report;

import com.spectre.Spectre.domain.service.report.ReportContext;
import com.spectre.Spectre.infrastructure.repository.report.ReportRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReportService implements ReportContext {

    private final ReportRepository reportRepository;
}
