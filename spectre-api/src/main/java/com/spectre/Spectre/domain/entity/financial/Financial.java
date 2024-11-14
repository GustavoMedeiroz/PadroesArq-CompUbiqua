package com.spectre.Spectre.domain.entity.financial;

import com.spectre.Spectre.domain.vo.base.BaseEntity;
import com.spectre.Spectre.application.core.dtos.financial.FinancialDto;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Table(name = "spectre_financial")
@Entity
public class Financial extends BaseEntity implements Serializable {

    @Column(name = "cash_inflow")
    private Double cashInflow;

    @Column(name = "cash_outflow")
    private Double cashOutflow;

    @Override
    public FinancialDto mapEntityToDto() {
        FinancialDto financialDto = new FinancialDto();

        financialDto.setId(this.getId());
        financialDto.setCashInflow(this.getCashInflow());
        financialDto.setCashOutflow(this.getCashOutflow());
        financialDto.setCreatedAt(this.getCreatedAt());
        financialDto.setUpdatedAt(this.getUpdatedAt());

        return financialDto;
    }
}
