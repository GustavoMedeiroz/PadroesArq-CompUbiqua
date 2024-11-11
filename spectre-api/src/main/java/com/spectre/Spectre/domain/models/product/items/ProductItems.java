package com.spectre.Spectre.domain.models.product.items;

import com.spectre.Spectre.infrastructure.base.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "spectre_product_items")
@Entity
public class ProductItems extends BaseEntity {
}
