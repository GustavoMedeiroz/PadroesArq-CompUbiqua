package com.spectre.Spectre.application.core.financial;

import com.spectre.Spectre.application.core.dtos.financial.FinancialDto;
import com.spectre.Spectre.domain.entity.financial.Financial;
import com.spectre.Spectre.domain.service.financial.FinancialContext;
import com.spectre.Spectre.domain.vo.exception.exceptions.NotFoundException;
import com.spectre.Spectre.domain.vo.utils.Functions;
import com.spectre.Spectre.infrastructure.repository.financial.FinancialRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class FinancialService implements FinancialContext {

    private static final String FINANCIAL_NOT_FOUND = "Registro financeiro não encontrado";

    private final FinancialRepository financialRepository;

    @Override
    public Page<Financial> findAll(Pageable pageable) {
        return this.financialRepository.findAll(pageable);
    }

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
    public void update(FinancialDto financial) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(financial.getId()) && this.existsById(financial.getId()),
                () -> new NotFoundException(FINANCIAL_NOT_FOUND)
        );
        Financial financialToUpdate = this.findById(financial.getId());

        this.mapFinancialToUpdate(financial, financialToUpdate);

        this.financialRepository.save(financialToUpdate);
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

    private void mapFinancialToUpdate(FinancialDto financial, Financial financialToUpdate) {
        financialToUpdate.setCashInflow(financial.getCashInflow());
        financialToUpdate.setCashOutflow(financial.getCashOutflow());
    }
}
