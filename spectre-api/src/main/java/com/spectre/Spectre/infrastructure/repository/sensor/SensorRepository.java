package com.spectre.Spectre.infrastructure.repository.sensor;

import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.vo.enums.SensorType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SensorRepository extends JpaRepository<Sensor, Long> {
    @Query("""
        FROM Sensor s
        WHERE (:types IS NULL OR s.type IN :types)
    """)
    Page<Sensor> findAllByType(@Param("types") List<SensorType> types, Pageable pageable);
}
