package com.spectre.Spectre.presentation.mqttser;

import com.spectre.Spectre.application.core.mqttserv.MqttApplicationService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mqtt")
public class MqttController {
    private final MqttApplicationService mqttService;

    public MqttController() {
        this.mqttService = new MqttApplicationService();
    }

    @PostMapping("/publish")
    public String publishMessage(@RequestParam String topic, @RequestParam String message) {
        mqttService.sendMessage(topic, message);
        return "Message published to topic: " + topic;
    }

    @PostMapping("/subscribe")
    public String subscribeToTopic(@RequestParam String topic) {
        mqttService.listenToTopic(topic);
        return "Subscribed to topic: " + topic;
    }
}