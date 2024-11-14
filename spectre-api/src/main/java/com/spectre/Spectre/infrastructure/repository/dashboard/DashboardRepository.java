package com.spectre.Spectre.infrastructure.repository.dashboard;

import com.spectre.Spectre.domain.entity.dashboard.Dashboard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DashboardRepository extends JpaRepository<Dashboard, Long> {
}
