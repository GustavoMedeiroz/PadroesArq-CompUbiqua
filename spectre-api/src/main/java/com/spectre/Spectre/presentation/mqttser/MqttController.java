package com.spectre.Spectre.presentation.mqttser;

import com.spectre.Spectre.application.core.mqttserv.MqttApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mqtt")
@RequiredArgsConstructor
public class MqttController {
    private final MqttApplicationService mqttService;

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