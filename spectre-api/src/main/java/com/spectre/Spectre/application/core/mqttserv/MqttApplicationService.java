package com.spectre.Spectre.application.core.mqttserv;

import com.spectre.Spectre.infrastructure.mqtt.MqttClientService;

public class MqttApplicationService {
    private final MqttClientService mqttClientService;

    public MqttApplicationService() {
        this.mqttClientService = new MqttClientService();
    }

    public void sendMessage(String topic, String message) {
        mqttClientService.publishMessage(topic, message);
    }

    public void listenToTopic(String topic) {
        mqttClientService.subscribeToTopic(topic);
    }
}
