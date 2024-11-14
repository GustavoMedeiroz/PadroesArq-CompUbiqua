package com.spectre.Spectre.application.core.financial;

import com.spectre.Spectre.domain.service.financial.FinancialContext;
import com.spectre.Spectre.infrastructure.repository.financial.FinancialRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FinancialService implements FinancialContext {

    private final FinancialRepository financialRepository;
}
