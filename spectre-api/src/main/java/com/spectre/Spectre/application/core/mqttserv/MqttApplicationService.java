package com.spectre.Spectre.application.core.mqttserv;

import com.spectre.Spectre.infrastructure.mqtt.MqttClientService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MqttApplicationService {
    private final MqttClientService mqttClientService;

    public void sendMessage(String topic, String message) {
        mqttClientService.publishMessage(topic, message);
    }

    public void listenToTopic(String topic) {
        mqttClientService.subscribeToTopic(topic);
    }
}
