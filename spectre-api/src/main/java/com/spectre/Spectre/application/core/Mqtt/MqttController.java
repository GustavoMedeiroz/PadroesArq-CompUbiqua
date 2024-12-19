package com.spectre.Spectre.application.core.Mqtt;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mqtt")
public class MqttController {

    private final MqttPublisher publisher;

    public MqttController(MqttPublisher publisher) {
        this.publisher = publisher;
    }

    @PostMapping("/publish")
    public String publishMessage(@RequestParam String topic, @RequestParam String message) {
        publisher.publish(topic, message);
        return "Mensagem publicada!";
    }
}
