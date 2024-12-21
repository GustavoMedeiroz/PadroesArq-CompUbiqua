import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

class DetailsPopupFluxo extends StatelessWidget {
  const DetailsPopupFluxo({super.key, required this.data});

  final String data;

  _criaRowInformacoes(String label, String value) {
    //cria cada linha de informações sobre o sensor
    return Row(
      //quantidade de clients
      children: [
        Expanded(
          flex: 7,
          //Expanded para que o primeiro Text ocupe todo o espaço diponível
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
        Spacer(), //Spacer para empurrar o segundo text para a borda direita da Row
        Text(
          value.toString(), //Mostrar dado dinâmico
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Colors.white,
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
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(94, 179, 226, 1),
                  Color.fromRGBO(50, 158, 218, 1),
                  ], // Defina as cores do gradiente aqui
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20), // Manter o borderRadius
              ),
              child: SizedBox(
                height: 230,
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
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fluxo de Clientes:',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  data,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Color.fromRGBO(255, 255, 255, 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Column(
                        children: [
                          _criaRowInformacoes('Total de clientes:', '22'),
                          _criaRowInformacoes('Qntd. de clientes em tempo real:', '5'),
                          _criaRowInformacoes('Horário de pico:', '18:30'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
