package com.spectre.Spectre.domain.models.product;

import com.spectre.Spectre.infrastructure.base.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "spectre_product")
@Entity
public class Product extends BaseEntity {
}
