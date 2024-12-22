import 'package:flutter/material.dart';
import 'package:spectre_app/components/details_popup_temp.dart';
import 'package:spectre_app/components/limits_popup_temp.dart';
import 'package:spectre_app/components/status_label.dart';

import '../core/models/sensor_model.dart';

class CardTemperatura extends StatelessWidget {
  const CardTemperatura(
      {super.key, required this.cardSize, required this.sensor});

  final double cardSize;
  final SensorModel sensor;

  void mostrarTelaLimites(BuildContext context) {
    Navigator.pop(
        context); //Retirando o popup atual da tela para adicionar o popup de limites
    showDialog(
        context: context,
        barrierDismissible:
            true, // Isso permite que o usuário feche o dialog ao clicar fora dele
        builder: (context) {
          return LimitsPopupTemp(sensor: sensor); // Passando o sensor para o LimitsPopupTemp
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          cardSize, //definindo a altura aqui também pq caso contrário não carrega fora do Carousel
      margin: EdgeInsets.only(right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          showDialog(
              //Abrir popup de detalhes
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return DetailsPopupTemp(
                  sensor: sensor,
                ); //acho que tem que passar o sensor como objeto no parâmetro depois
              });
        },
        splashColor: Colors.blue,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 21,
            vertical: 24,
          ),
          child: Column(
            //coluna para envolver os textos do título do Card
            crossAxisAlignment: CrossAxisAlignment.start, //alinhando à esquerda
            children: [
              Row(
                //Row da temperatura, descrição e estado (CRÍTICO, NORMAL...)
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sensor.name, //Nome do sensor
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Temperatura ambiente',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 60),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  StatusLabel().checkTemperatureStatus(
                      sensor.currentValue, sensor.minValue, sensor.maxValue),
                ],
              ),
              SizedBox(height: 58),
              Column(
                //Coluna da qntd de clientes e horários de pico
                children: [
                  Row(
                    //quantidade de clients
                    children: [
                      Expanded(
                        flex: 5,
                        //Expanded para que o primeiro Text ocupe todo o espaço diponível
                        child: Text(
                          'Temperatura Atual:',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Spacer(), //Spacer para empurrar o segundo text para a borda direita da Row
                      Text(
                        '${sensor.currentValue}°C',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //quantidade de clients
                    children: [
                      Expanded(
                        flex: 5,
                        //Expanded para que o primeiro Text ocupe todo o espaço diponível
                        child: Text(
                          'Temperatura Mínima:',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Spacer(), //Spacer para empurrar o segundo text para a borda direita da Row
                      Text(
                        '${sensor.minValue}°C',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //horários de pico
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Temperatura Máxima:',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${sensor.maxValue}°C',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Color.fromRGBO(0, 0, 0, 0.5)),
                ],
              ),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      color: Colors.black,
                      size: 29,
                    ), //ícone do carrinho
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visualizar mais informações', //Valor Atual de Umidade
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Sensor de temperatura', //Condição atual de umidade referente ao limite
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 29,
                    ), //ícone da seta
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
