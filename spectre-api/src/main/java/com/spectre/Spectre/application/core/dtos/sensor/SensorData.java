package com.spectre.Spectre.application.core.dtos.sensor;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SensorData {
    private Long id;
    private Double value;

    @Override
    public String toString() {
        return "SensorData{" +
                "id=" + id +
                ", value=" + value +
                '}';
    }
}
