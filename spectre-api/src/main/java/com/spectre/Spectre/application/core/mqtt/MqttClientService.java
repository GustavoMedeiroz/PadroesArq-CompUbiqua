package com.spectre.Spectre.application.core.mqtt;
import com.google.gson.Gson;
import com.spectre.Spectre.application.core.dtos.sensor.SensorData;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.service.sensor.SensorContext;
import lombok.RequiredArgsConstructor;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class MqttClientService implements MqttCallback {

    private final MqttClient mqttClient;
    private final SensorContext sensorContext;

    public void subscribe(String topic) {
        Gson gson = new Gson();
        try {
            mqttClient.subscribe(topic, (receivedTopic, message) -> {
                // Processa a mensagem recebida
                System.out.println("Mensagem recebida no tópico: " + receivedTopic);
                System.out.println("Conteúdo: " + new String(message.getPayload()));

                gson.toJson(message.getPayload());
                SensorData sensorData = gson.fromJson(new String(message.getPayload()), SensorData.class);
                Sensor sensor = this.sensorContext.findById(sensorData.getId());
                if (!Objects.equals(sensorData.getValue(), sensor.getCurrentValue())) {
                    sensor.setCurrentValue(sensorData.getValue());
                    Sensor updatedSensor = this.sensorContext.update(sensor.mapDtoToEntity());
                    if (this.validateSensorLimits(updatedSensor)) {
                        System.out.println("Sensor fora dos limites.....");
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Boolean validateSensorLimits(Sensor sensor) {
        return sensor.getCurrentValue() < sensor.getMinValue() || sensor.getCurrentValue() > sensor.getMaxValue();
    }

    @Override
    public void connectionLost(Throwable cause) {
        System.err.println("Conexão perdida com o broker MQTT: " + cause.getMessage());
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) throws Exception {
        System.out.println("Mensagem recebida no tópico: " + topic);
        System.out.println("Conteúdo: " + new String(message.getPayload()));
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken token) {
        // Não usado para assinaturas
    }
}
