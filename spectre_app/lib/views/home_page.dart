import 'package:flutter/material.dart';
import 'package:spectre_app/components/card_estoque.dart';
import 'package:spectre_app/components/card_temperatura.dart';

import '../components/card_fluxo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(
            top: 15,
            bottom: 10,
            left: 30,
          ),
          child: Text(
            'Bom dia, Gustavo!',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Aqui estão suas informações em tempo real...',
                style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SizedBox(
            height: 265,
            child: CarouselView( //Carrossel de fluxo de clientes
              itemSnapping: true,
              itemExtent: 350, //tamanho horizontal de cada item
              children: [ //conteúdo do carrossel
                CardFluxo(), //importando card do card_fluxo.dart
                CardFluxo(),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Confira as condições do seu estoque...',
                style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.normal,
                fontSize: 15,
                ),
          ),
        ),
        CardEstoque(), //Separar o carousel de dentro desse component
                SizedBox(height: 20),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Temperatura e umidade...',
                style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.normal,
                fontSize: 15,
                ),
          ),
        ),
        CardTemperatura(),
      ],
    );
  }
}
