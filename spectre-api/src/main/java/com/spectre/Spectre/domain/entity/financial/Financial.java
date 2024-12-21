package com.spectre.Spectre.domain.entity.financial;

import com.spectre.Spectre.domain.vo.base.BaseEntity;
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

}
