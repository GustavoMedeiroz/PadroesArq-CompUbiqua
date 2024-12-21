package com.spectre.Spectre.domain.service.financial;

import com.spectre.Spectre.application.core.dtos.financial.FinancialDto;
import com.spectre.Spectre.domain.entity.financial.Financial;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface FinancialContext {

    Page<Financial> findAll(Pageable pageable);

    Financial findById(Long id);

    Financial create(FinancialDto financialDto);

    void update(FinancialDto financialDto);

    void delete(Long id);
}
