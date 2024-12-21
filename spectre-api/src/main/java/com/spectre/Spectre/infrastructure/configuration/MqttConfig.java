package com.spectre.Spectre.infrastructure.configuration;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MqttConfig {
    private static final String BROKER_URL = "tcp://ec2-44-208-36-236.compute-1.amazonaws.com:1883"; // URL do broker
    private static final String CLIENT_ID = "spring-boot-mqtt-client";

    @Bean
    public MqttClient mqttClient() throws Exception {
        MqttClient mqttClient = new MqttClient(BROKER_URL, CLIENT_ID, new MemoryPersistence());
        // MqttConnectOptions options = new MqttConnectOptions();
        // options.setCleanSession(true);
        // options.setAutomaticReconnect(true);
        // mqttClient.connect(options);
        // System.out.println("Conectado");

        return mqttClient;
    }
}
