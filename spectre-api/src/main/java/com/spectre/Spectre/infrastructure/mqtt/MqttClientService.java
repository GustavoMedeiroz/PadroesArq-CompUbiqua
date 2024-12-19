package com.spectre.Spectre.infrastructure.mqtt;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.eclipse.paho.client.mqttv3.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MqttClientService {
    private static final String BROKER_URL = "tcp://ec2-54-89-235-178.compute-1.amazonaws.com:1883";
    private static final String CLIENT_ID = "spectre";

    private MqttClient mqttClient;

    @PostConstruct
    public void init() {
        try {
            mqttClient = new MqttClient(BROKER_URL, CLIENT_ID);
            MqttConnectOptions options = new MqttConnectOptions();
            options.setCleanSession(true);
            mqttClient.connect(options);
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

//    public MqttClientService() {
//        try {
//            mqttClient = new MqttClient(BROKER_URL, CLIENT_ID);
//            MqttConnectOptions options = new MqttConnectOptions();
//            options.setCleanSession(true);
//            mqttClient.connect(options);
//        } catch (MqttException e) {
//            e.printStackTrace();
//        }
//    }

    public void publishMessage(String topic, String message) {
        try {
            MqttMessage mqttMessage = new MqttMessage(message.getBytes());
            mqttMessage.setQos(1);
            mqttClient.publish(topic, mqttMessage);
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

    public void subscribeToTopic(String topic) {
        try {
            mqttClient.subscribe(topic, (t, msg) -> System.out.println(new String(msg.getPayload())));
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

    public void disconnect() {
        try {
            mqttClient.disconnect();
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }
}

/*
*
* Receber informações dos sensores
* Ficar mapeando os sensores
* SE E SOMENTE SE o currentValue for diferente do lastValue, enviar uma notificação
* Usar findById para pegar o sensor
* Atualizar o sensor
* Adaptar o aplicativo para sempre ficar ouvindo a api?
* Usar async talvez?
* Fazer a API enviar uma notificação apenas quando os valores forem alterados?
* */