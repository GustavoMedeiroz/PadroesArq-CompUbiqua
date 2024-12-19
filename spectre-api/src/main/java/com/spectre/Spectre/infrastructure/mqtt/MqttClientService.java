package com.spectre.Spectre.infrastructure.mqtt;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spectre.Spectre.application.core.dtos.sensor.SensorData;
import com.spectre.Spectre.application.core.sensor.SensorService;
import com.spectre.Spectre.domain.entity.sensor.Sensor;
import com.spectre.Spectre.domain.service.sensor.SensorContext;
import com.spectre.Spectre.domain.vo.exception.NotFoundException;
import com.spectre.Spectre.infrastructure.repository.sensor.SensorRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.eclipse.paho.client.mqttv3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.logging.Logger;

@Service
@RequiredArgsConstructor
public class MqttClientService {
    private static final Logger LOGGER = Logger.getLogger(MqttClientService.class.getName());
    private static final String BROKER_URL = "tcp://ec2-54-89-235-178.compute-1.amazonaws.com:1883";
    private static final String CLIENT_ID = "spectre";

//    private final SensorService sensorService;

    private Gson gson;

    private MqttClient mqttClient;

    @PostConstruct
    public void init() {
        try {
            mqttClient = new MqttClient(BROKER_URL, CLIENT_ID);
            gson = new Gson();
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
                String message = new String(msg.getPayload());
                System.out.println("Received message: " + message + " from topic: " + t);

                try {
                    gson.toJson(message);
                    SensorData sensorData = gson.fromJson(message, SensorData.class);
//
//                    Sensor sensorExample = this.sensorService.findById(sensorData.getId());
//                    System.out.println("Sensor example: " + sensorExample);

                    System.out.println("Parsed sensor data: " + sensorData);
                    LOGGER.info(sensorData.getId().toString());
                    LOGGER.info(sensorData.getValue().toString());
//                    Gson jsonObject = new Gson();
//                    String sensorData = jsonObject.toJson(message);
//                    System.out.println("Parsed sensor data: " + sensorData);
//                    System.out.println("Parsed message: " + jsonObject);
//
//                    SensorData sensorData = gson.fromJson(jsonObject, SensorData.class);
//                    System.out.println("Parsed sensor data: " + sensorData);
                } catch (Exception e) {
                    LOGGER.warning("Error processing message: " + e.getMessage());
                }
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