package com.spectre.Spectre.application.core.dtos.financial;

import com.spectre.Spectre.domain.entity.financial.Financial;
import com.spectre.Spectre.domain.vo.base.BaseEntityDto;
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
