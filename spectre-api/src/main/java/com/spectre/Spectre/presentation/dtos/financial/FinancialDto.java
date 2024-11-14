package com.spectre.Spectre.presentation.dtos.financial;

import com.spectre.Spectre.domain.models.financial.Financial;
import com.spectre.Spectre.infrastructure.base.BaseEntityDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FinancialDto extends BaseEntityDto<Financial> {

    private Double cashInflow;
    private Double cashOutflow;

    @Override
    public Financial mapDtoToEntity() {
        Financial financial = new Financial();

        financial.setId(this.getId());
        financial.setCashInflow(this.getCashInflow());
        financial.setCashOutflow(this.getCashOutflow());
        financial.setCreatedAt(this.getCreatedAt());
        financial.setUpdatedAt(this.getUpdatedAt());

        return financial;
    }
}
