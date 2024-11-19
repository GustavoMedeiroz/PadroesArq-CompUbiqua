package com.spectre.Spectre.domain.service.financial;

import com.spectre.Spectre.application.core.dtos.financial.FinancialDto;
import com.spectre.Spectre.domain.entity.financial.Financial;

public interface FinancialContext {

    Financial findById(Long id);

    Financial create(FinancialDto financialDto);

    void update(FinancialDto financialDto);

    void delete(Long id);
}
