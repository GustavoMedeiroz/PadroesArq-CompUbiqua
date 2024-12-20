package com.spectre.Spectre.application.core.mqtt;
import lombok.RequiredArgsConstructor;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MqttPublisher {

    private final MqttClient mqttClient;

    public void publish(String topic, String payload) {
        try {
            MqttMessage message = new MqttMessage(payload.getBytes());
            message.setQos(1);
            mqttClient.publish(topic, message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
