package com.spectre.Spectre.presentation.financial;

import com.spectre.Spectre.domain.service.financial.FinancialContext;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/financial")
@RequiredArgsConstructor
public class FinancialResource {

    private final FinancialContext financialService;
}
