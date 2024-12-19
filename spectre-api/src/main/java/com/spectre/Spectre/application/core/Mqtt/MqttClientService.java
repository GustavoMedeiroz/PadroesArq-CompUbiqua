package com.spectre.Spectre.application.core.Mqtt;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.springframework.stereotype.Service;
@Service
public class MqttClientService implements MqttCallback {

    private final MqttClient mqttClient;

    public MqttClientService(MqttClient mqttClient) {
        this.mqttClient = mqttClient;
    }

    public void subscribe(String topic) {
        try {
            mqttClient.subscribe(topic, (receivedTopic, message) -> {
                // Processa a mensagem recebida
                System.out.println("Mensagem recebida no tópico: " + receivedTopic);
                System.out.println("Conteúdo: " + new String(message.getPayload()));
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void connectionLost(Throwable cause) {
        System.err.println("Conexão perdida com o broker MQTT: " + cause.getMessage());
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) throws Exception {
        System.out.println("Mensagem recebida no tópico: " + topic);
        System.out.println("Conteúdo: " + new String(message.getPayload()));
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken token) {
        // Não usado para assinaturas
    }
}
