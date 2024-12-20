package com.spectre.Spectre.presentation.mqtt;
import com.spectre.Spectre.application.core.mqtt.MqttPublisher;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mqtt")
@RequiredArgsConstructor
public class MqttController {

    private final MqttPublisher publisher;

    @PostMapping("/publish")
    public String publishMessage(@RequestParam String topic, @RequestParam String message) {
        publisher.publish(topic, message);
        return "Mensagem publicada!";
    }
}
