package com.spectre.Spectre;

import com.spectre.Spectre.application.core.mqtt.MqttClientService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class SpectreApplication extends SpringBootServletInitializer implements CommandLineRunner{

    private final MqttClientService mqttClientService;

    public SpectreApplication(MqttClientService mqttClientService) {
        this.mqttClientService = mqttClientService;
    }


    public static void main(String[] args) {
        SpringApplication.run(SpectreApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
//         Assinar tópico para receber mensagens
        // String topic = "sensors/temp1";
        // mqttClientService.subscribe(topic);
        // System.out.println(topic);
        // String topic1 = "sensors/humidity1";
        // mqttClientService.subscribe(topic1);
        // System.out.println(topic1);
        // String topic2 = "sensors/weight1";
        // mqttClientService.subscribe(topic2);
        // System.out.println(topic2);
    }
}
