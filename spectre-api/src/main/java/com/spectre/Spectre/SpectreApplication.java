package com.spectre.Spectre;

import com.spectre.Spectre.infrastructure.mqtt.MqttClientService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Arrays;
import java.util.List;

@SpringBootApplication
public class SpectreApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpectreApplication.class, args);

        MqttClientService mqttService = new MqttClientService();

        mqttService.init();
        // Tópico para teste
        List<String> topics = Arrays.asList(
                "sensors/temp1",
                "sensors/humidity1",
                "sensors/weight1",
                "sensors/motion1"
        );

        topics.forEach(mqttService::subscribeToTopic);

        // Publicar uma mensagem no tópico
        String testMessage = "Teste de mensagem MQTT";
        topics.forEach(topic -> mqttService.publishMessage(topic, testMessage));

        // Esperar para verificar a mensagem recebida
        try {
            Thread.sleep(5000000); // Espera 5 segundos para garantir que a mensagem seja recebida
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // Desconectar após o teste
        mqttService.disconnect();
    }
}
