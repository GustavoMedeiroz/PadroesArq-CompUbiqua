import 'package:flutter/material.dart';

class CardTemperatura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 24,
        ),
        child: Column(
          //coluna para envolver os textos do título do Card
          crossAxisAlignment: CrossAxisAlignment.start, //alinhando à esquerda
          children: [
            Row( //Row da temperatura, descrição e estado (CRÍTICO, NORMAL...)
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '26°C:',
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
                Container(
                    alignment: Alignment.center,
                    width: 84,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(41),
                      color: Color.fromRGBO(44, 155, 217, 0.1),
                    ),
                    child: Text(
                      'NORMAL',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 71),
            Column(
              //Coluna da qntd de clientes e horários de pico
              children: [
                Row(
                  //quantidade de clients
                  children: [
                    Expanded( //Expanded para que o primeiro Text ocupe todo o espaço diponível
                      child: Text(
                        'Mínima:',
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
                      '+15°C',
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
                      child: Text(
                        'Máxima:',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '+30°C',
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
                          '47% de Umidade Relativa',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Normal',
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
    );
  }
}
