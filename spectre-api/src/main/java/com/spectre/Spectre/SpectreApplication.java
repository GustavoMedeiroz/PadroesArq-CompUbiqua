package com.spectre.Spectre;

import com.spectre.Spectre.application.core.Mqtt.MqttClientService;
import com.spectre.Spectre.application.core.Mqtt.MqttConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.core.task.TaskExecutor;

import java.util.Arrays;
import java.util.List;

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
        // Assinar tópico para receber mensagens
        String topic = "sensors/temp1";
        mqttClientService.subscribe(topic);
        System.out.println(topic);
        String topic1 = "sensors/humidity1";
        mqttClientService.subscribe(topic1);
        System.out.println(topic1);
    }
}
