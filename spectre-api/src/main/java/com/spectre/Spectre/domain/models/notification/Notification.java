package com.spectre.Spectre.domain.models.notification;

import com.spectre.Spectre.infrastructure.base.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "spectre_notification")
@Entity
public class Notification extends BaseEntity {
}
