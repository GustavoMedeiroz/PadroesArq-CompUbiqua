package com.spectre.Spectre.infrastructure.mqtt;

import org.eclipse.paho.client.mqttv3.*;

public class MqttClientService {
    private static final String BROKER_URL = "tcp://ec2-18-206-38-101.compute-1.amazonaws.com:1883";
    private static final String CLIENT_ID = "spectre";

    private MqttClient mqttClient;

    public MqttClientService() {
        try {
            mqttClient = new MqttClient(BROKER_URL, CLIENT_ID);
            MqttConnectOptions options = new MqttConnectOptions();
            options.setCleanSession(true);
            mqttClient.connect(options);
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

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
            mqttClient.subscribe(topic, (t, msg) -> {
                System.out.println("Message received: " + new String(msg.getPayload()));
            });
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