import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:spectre_app/components/status_label.dart';
import 'package:spectre_app/components/sensor_item.dart';

class DetailsPopupTemp extends StatelessWidget {
  const DetailsPopupTemp({super.key});

  //recebe um objeto SensorModel referente ao sensor atual vindo da tela sensor_page ou temperatura_page

  void _verificaTipoSensor() {
    //VERIFICA TIPO DO SENSOR (PESO OU TEMPERATURA E UMIDADE)
  }

  _criaRowInformacoes(String label, double value) { //cria cada linha de informações sobre o sensor
    return Row(
      //quantidade de clients
      children: [
        Expanded(
          flex: 4,
          //Expanded para que o primeiro Text ocupe todo o espaço diponível
          child: Text(
            label,
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
          value.toString(), //Mostrar dado dinâmico
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }


  // BUILD //


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: PopupCard(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), //border de cada Card
            ),
            elevation: 5,
            child: SizedBox(
              height: 265,
              width: 320,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 24,
                ),
                child: Column(
                  //coluna para envolver os textos do título do Card
                  crossAxisAlignment:
                      CrossAxisAlignment.start, //alinhando à esquerda
                  children: [
                    Row(
                      //Row da temperatura, descrição e estado
                      //Estado (CRÍTICO, NORMAL...) é dado pelo status_label.dart
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '26°C', //PASSAR VALOR ATUAL DA TEMPERATURA
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Temperatura Ambiente', //PASSAR O NOME DO SENSOR, PQ PODE SER TEMP AMBIENTE OU DE UM FREEZER, POR EXEMPLO
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
                        StatusLabel().checkTemperatureAndHumidityStatus(26, 18, 30, 47, 30), //VAI RECEBER O VALOR ATUAL DO SENSOR, VALOR MÍNIMO, VALOR MÁXIMO
                      ],
                    ),
                    SizedBox(height: 25),
                    Column(
                      children: [
                        _criaRowInformacoes('Limite mínimo (°C):', 18),
                        _criaRowInformacoes('Limite máximo (°C):', 30),
                        _criaRowInformacoes('Umidade relativa do ar:', 47),
                        _criaRowInformacoes('Limite mínimo de Umidade:', 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          child: Divider(color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 3,
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => SensorItem().mostrarTelaLimites(context),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sensors,
                                color: Colors.black,
                                size: 34,
                              ), //ícone do carrinho
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Alterar limites',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Sensores de Temp. e Umidade',
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
