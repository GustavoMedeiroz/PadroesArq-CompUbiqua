package com.spectre.Spectre.infrastructure.repository.financial;

import com.spectre.Spectre.domain.entity.financial.Financial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FinancialRepository extends JpaRepository<Financial, Long> {
}
