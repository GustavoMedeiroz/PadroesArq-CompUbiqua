package com.spectre.Spectre;

import com.spectre.Spectre.infrastructure.mqtt.MqttClientService;

public class MqttTest {
    public static void main(String[] args) {
        // Instanciar o serviço MQTT
        MqttClientService mqttService = new MqttClientService();

        // Tópico para teste
        String topic = "sensors/temp_humidity";

        // Assinar o tópico para receber mensagens
        mqttService.subscribeToTopic(topic);

        // Publicar uma mensagem no tópico
        String testMessage = "Teste de mensagem MQTT";
        mqttService.publishMessage(topic, testMessage);

        // Esperar para verificar a mensagem recebida
        try {
            Thread.sleep(5000); // Espera 5 segundos para garantir que a mensagem seja recebida
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // Desconectar após o teste
        mqttService.disconnect();
    }
}
