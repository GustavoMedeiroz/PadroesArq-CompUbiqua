package com.spectre.Spectre.infrastructure.repository.sensor;

import com.spectre.Spectre.domain.entity.sensor.Sensor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SensorRepository extends JpaRepository<Sensor, Long> {
}
