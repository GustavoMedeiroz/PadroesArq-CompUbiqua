package com.spectre.Spectre;

import com.spectre.Spectre.infrastructure.mqtt.MqttClientService;

import java.util.Arrays;
import java.util.List;

public class MqttTest {
    public static void main(String[] args) {
        // Instanciar o serviço MQTT
        MqttClientService mqttService = new MqttClientService();

        // Tópico para teste
        List<String> topics = Arrays.asList(
                "sensors/temp",
                "sensors/humidity",
                "sensors/weight",
                "sensors/motion"
        );

        // Assinar o tópico para receber mensagens
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
