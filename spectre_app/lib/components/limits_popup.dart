import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'status_label.dart';

class LimitsPopup extends StatelessWidget {
  const LimitsPopup({super.key});

  void _confirmarAlteracoes() {
    //confirmar envio do formulário -> alterar as informações no banco
  }

  inputValue() {
    return Row(
      //quantidade de clients
      children: [
        Expanded(
          flex: 4,
          //Expanded para que o primeiro Text ocupe todo o espaço diponível
          child: Text(
            'Estoque atual:',
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
          '8', //Mostrar dado dinâmico
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

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
                                'Frutas', //Teoricamente tem um ícone aqui tb mas vamos deixar pra implementar só se der tempo
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Valores atuais do sensor',
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
                      //Coluna da qntd de clientes e horários de pico
                      children: [
                        inputValue(), //chamando a função do campo de alterar valor (passar label, valor atual e método de alterar)
                        Row(
                          //horários de pico
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Limite mínimo (un.)',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '10', //Mostrar dado dinâmico
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
                              flex: 4,
                              child: Text(
                                'Limite máximo (un.)',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '50', //Mostrar dado dinâmico
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
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
                          onTap: () => _confirmarAlteracoes(),
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
                                      'Confirmar alterações',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
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
