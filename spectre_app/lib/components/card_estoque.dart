import 'package:flutter/material.dart';

class CardEstoque extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SizedBox(
            height: 173,
            child: CarouselView( //Carrossel de fluxo de clientes
              itemSnapping: true,
              itemExtent: 175, //tamanho horizontal de cada item
              children: [ //conteúdo do carrossel
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 12,
                            left: 16,
                          ),
                          child: Icon(
                            size: 26,
                            Icons.lunch_dining
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 9,
                            right: 9,
                            left: 27,
                          ),
                          child: Container (
                            alignment: Alignment.center,
                            width: 84,
                            height: 33,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(41),
                              color: Color.fromRGBO(255, 0, 0, 0.1),
                            ),
                            child: Text(
                              'CRÍTICO',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 63),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Frutas',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Acabará em breve!',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ),
          Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 12,
                            left: 16,
                          ),
                          child: Icon(
                            size: 26,
                            Icons.lunch_dining
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 9,
                            right: 9,
                            left: 27,
                          ),
                          child: Container (
                            alignment: Alignment.center,
                            width: 84,
                            height: 33,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(41),
                              color: Color.fromRGBO(255, 0, 0, 0.1),
                            ),
                            child: Text(
                              'CRÍTICO',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 63),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Frutas',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Acabará em breve!',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 12,
                            left: 16,
                          ),
                          child: Icon(
                            size: 26,
                            Icons.lunch_dining
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 9,
                            right: 9,
                            left: 27,
                          ),
                          child: Container (
                            alignment: Alignment.center,
                            width: 84,
                            height: 33,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(41),
                              color: Color.fromRGBO(255, 0, 0, 0.1),
                            ),
                            child: Text(
                              'CRÍTICO',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 63),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Frutas',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Acabará em breve!',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              ],
            ),
          ),
        );
  }
}