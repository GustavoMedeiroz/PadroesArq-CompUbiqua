package com.spectre.Spectre.presentation.dashboard;

import com.spectre.Spectre.domain.service.dashboard.DashboardContext;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/dashboard")
@RequiredArgsConstructor
public class DashboardResource {

    private final DashboardContext dashboardService;
}
