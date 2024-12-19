package com.spectre.Spectre.application.core.Mqtt;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Service
public class MqttSubscriber implements MqttCallback {

    private final MqttClient mqttClient;

    public MqttSubscriber(MqttClient mqttClient) {
        this.mqttClient = mqttClient;
    }

    @PostConstruct
    public void init() {
        try {
            mqttClient.setCallback(this);
            mqttClient.subscribe("meu/topico");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void connectionLost(Throwable cause) {
        System.out.println("Conexão perdida: " + cause.getMessage());
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) {
        System.out.println("Mensagem recebida: " + new String(message.getPayload()));
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken token) {
        System.out.println("Entrega completa!");
    }
}

