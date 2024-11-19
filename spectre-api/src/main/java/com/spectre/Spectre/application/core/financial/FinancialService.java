package com.spectre.Spectre.application.core.financial;

import com.spectre.Spectre.application.core.dtos.financial.FinancialDto;
import com.spectre.Spectre.domain.entity.financial.Financial;
import com.spectre.Spectre.domain.service.financial.FinancialContext;
import com.spectre.Spectre.domain.vo.exception.exceptions.NotFoundException;
import com.spectre.Spectre.domain.vo.utils.Functions;
import com.spectre.Spectre.infrastructure.repository.financial.FinancialRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class FinancialService implements FinancialContext {

    private static final String FINANCIAL_NOT_FOUND = "Registro financeiro não encontrado";

    private final FinancialRepository financialRepository;

    @Override
    public Financial findById(Long id) {
        return this.financialRepository.findById(id).orElseThrow(() -> new NotFoundException(FINANCIAL_NOT_FOUND));
    }

    @Override
    @Transactional
    public Financial create(FinancialDto financialDto) {
        Financial financial = financialDto.mapDtoToEntity();
        return this.financialRepository.save(financial);
    }

    @Override
    @Transactional
    public void update(FinancialDto financialToUpdate) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(financialToUpdate.getId()) && this.existsById(financialToUpdate.getId()),
                () -> new NotFoundException(FINANCIAL_NOT_FOUND)
        );
        Financial savedFinancial = this.findById(financialToUpdate.getId());

        this.mapFinancialToUpdate(financialToUpdate, savedFinancial);

        this.financialRepository.save(savedFinancial);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Functions.acceptFalseThrows(
                this.existsById(id),
                () -> new NotFoundException(FINANCIAL_NOT_FOUND)
        );
        this.financialRepository.deleteById(id);
    }

    private Boolean existsById(Long id) {
        return this.financialRepository.existsById(id);
    }

    private void mapFinancialToUpdate(FinancialDto financialToUpdate, Financial savedFinancial) {
        savedFinancial.setCashInflow(financialToUpdate.getCashInflow());
        savedFinancial.setCashOutflow(financialToUpdate.getCashOutflow());
    }
}
