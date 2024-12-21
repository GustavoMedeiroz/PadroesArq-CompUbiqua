package com.spectre.Spectre.domain.entity.persona;

import com.spectre.Spectre.domain.vo.base.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.br.CPF;

import java.io.Serializable;

@Getter
@Setter
@Table(name = "spectre_persona")
@Entity
public class Persona extends BaseEntity implements Serializable {

    @Column(name = "name")
    private String name;

    @Column(name = "taxId")
    @CPF
    private String taxId;

    @Column(name = "phone")
    private String phone;

}
