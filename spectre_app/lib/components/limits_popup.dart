import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

import 'status_label.dart';

class LimitsPopup extends StatelessWidget {
  const LimitsPopup({super.key});

  void _confirmarAlteracoes() {
    //confirmar envio do formulário -> alterar as informações no banco
  }

  // Método para criar parte do card
  inputValue(BuildContext context, placeholder, double value) { //acrescentar nos parâmetros algo para verificar o tipo de valor a ser alterado no banco
    return Material(
      color: Colors.white,
      child: InkWell(
        child: Row(
          //quantidade de clients
          children: [
            Expanded(
              flex: 4,
              //Expanded para que o primeiro Text ocupe todo o espaço diponível
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeholder, //passando a String recebida
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    value.toString(), //convertendo o valor para String
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), //Spacer para empurrar o segundo text para a borda direita da Row
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
        onTap:() => showDialog(
          context: context,
          barrierDismissible: true, //Isso permite que o usuário feche o dialog ao clicar fora dele
          builder: (context) {
          return Text('Beleza');
          }
        ),
      ),
    );
  }

  // Builder //

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
              height: 320,
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
                        inputValue( //chamando a função do campo de alterar valor
                          context,
                          'Limite mínimo (un.):',
                          10, //passar o valor de limite mínimo do sensor
                        ),
                        SizedBox(height: 10),
                        inputValue(
                          context,
                          'Limite máximo (un.):',
                          50, //passar o valor de limite máximo do sensor
                        ),
                        SizedBox(height: 10),
                        inputValue(
                          context,
                          'Peso médio do produto (un.):',
                          1.44, //passar o valor do produto registrado no sensor
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
                                child: Text(
                                  'Confirmar alterações',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
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
