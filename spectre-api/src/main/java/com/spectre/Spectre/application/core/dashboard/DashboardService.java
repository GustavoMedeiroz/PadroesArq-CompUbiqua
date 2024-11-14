package com.spectre.Spectre.application.core.dashboard;

import com.spectre.Spectre.domain.service.dashboard.DashboardContext;
import com.spectre.Spectre.infrastructure.repository.dashboard.DashboardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DashboardService implements DashboardContext {

    private final DashboardRepository dashboardRepository;
}
