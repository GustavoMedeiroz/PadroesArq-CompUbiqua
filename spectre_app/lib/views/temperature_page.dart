import 'package:flutter/material.dart';

import '../components/card_temperatura.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(236, 236, 236, 0.6),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            height: 126,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding( //TÍTULO DA PÁGINA
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'Temperatura e Umidade',
                    style: TextStyle(
                      fontSize: 21,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding( //FILTRO DE BUSCA, podemos deixar por último (https://www.youtube.com/watch?v=ZHdg2kfKmjI)
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 20,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.tune),
                        hintText: 'Buscar',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(96, 96, 96, 0.5),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Color.fromRGBO(96, 96, 96, 5),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
          SizedBox( //CONSTRUINDO A LISTA DE SENSORES DE PESO DO ESTOQUE
            height: 700, //depois vou definir melhor essa altura
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 28,
                    right: 28,
                    bottom: 10,
                  ),
                  child: CardTemperatura(cardSize: 260),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}