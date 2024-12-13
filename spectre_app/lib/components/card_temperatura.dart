import 'package:flutter/material.dart';

class CardTemperatura extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
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
            SizedBox(height: 71),
            Column(
              //Coluna da qntd de clientes e horários de pico
              children: [
                Row(
                  //quantidade de clients
                  children: [
                    Text(
                      'Qntd. de clientes hoje:',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 130),
                    Text(
                      '22',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  //horários de pico
                  children: [
                    Text(
                      'Horário de pico:',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 154),
                    Text(
                      '18:30',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Divider(color: Color.fromRGBO(255, 255, 255, 0.5)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 29,
                ), //ícone do carrinho
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mais informações',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '01/11/2024',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 119),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 29,
                ), //ícone da seta
              ],
            ),
          ],
        ),
      ),
    );
  }
}