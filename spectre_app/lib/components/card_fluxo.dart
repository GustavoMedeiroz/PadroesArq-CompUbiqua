import 'package:flutter/material.dart';
import 'package:spectre_app/components/details_popup_fluxo.dart';

class CardFluxo extends StatelessWidget {
  const CardFluxo({super.key, required this.colorScheme, required this.data});

  final int colorScheme;
  final String data; //HOJE OU SEMANA

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //gradiente de cores
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorScheme == 1 ? [
            Color.fromRGBO(108, 185, 228, 1),
            Color.fromRGBO(45, 151, 211, 1),
          ] : colorScheme == 2 ? [
            Color.fromRGBO(127, 93, 249, 1),
            Color.fromRGBO(71, 24, 239, 1),
          ] : [
            Color.fromRGBO(255, 193, 7, 1),
            Color.fromRGBO(255, 152, 0, 1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          showDialog( //Abrir popup de detalhes
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return DetailsPopupFluxo(data: data);
            }
          );
        },
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
                'Fluxo de Clientes:',
                style: TextStyle(
                  fontFamily: 'Inter',
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
                  fontSize: 12,
                  color: Color.fromRGBO(255, 255, 255, 60),
                ),
              ),
              SizedBox(height: 70),
              Column(
                //Coluna da qntd de clientes e horários de pico
                children: [
                  Row(
                    //quantidade de clients
                    children: [
                      Expanded(
                        flex: 2, //proporção do expanded
                        child: Text(
                          'Qntd. de clientes:',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
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
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Horário de pico:',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
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
              Expanded(
                flex: 3,
                child: Row(
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
                            'Sensor de Movimento',
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
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
