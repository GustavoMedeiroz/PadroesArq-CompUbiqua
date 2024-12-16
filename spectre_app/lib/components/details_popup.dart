import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:spectre_app/components/status_label.dart';
import 'package:spectre_app/components/sensor_item.dart';

class DetailsPopup extends StatelessWidget {
  const DetailsPopup({super.key});

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
                                'Frutas:', //Teoricamente tem um ícone aqui tb mas vamos deixar pra implementar só se der tempo
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                StatusLabel().stockSubtitle(2, 3,
                                    7), //usar o stockSubtitle do StatusLabel passando os dados dinâmicos
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
                        StatusLabel().checkStockStatus(2, 3, 7), //VAI RECEBER O VALOR ATUAL DO SENSOR, VALOR MÍNIMO, VALOR MÁXIMO
                      ],
                    ),
                    SizedBox(height: 25),
                    Column(
                      children: [
                        _criaRowInformacoes('Estoque atual:', 8),
                        _criaRowInformacoes('Limite mínimo (un.):', 10),
                        _criaRowInformacoes('Limite máximo (un.):', 50),
                        _criaRowInformacoes('Peso médio do produto (kg):', 1.44),
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
                                      'Alterar limites / peso',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Sensor de peso',
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
