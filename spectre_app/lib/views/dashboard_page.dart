import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:spectre_app/components/card_estoque.dart';
import 'package:spectre_app/components/card_temperatura.dart';

import '../components/card_fluxo.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget> [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                top: 10,
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
            CarouselSlider( //Carrossel de fluxo de clientes
              options: CarouselOptions(
                enableInfiniteScroll: false,
                disableCenter: true,
                height: 265,
              ),
              items: [ //conteúdo do carrossel
                CardFluxo(), //importando card do card_fluxo.dart
                CardFluxo(),
              ],
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
            Container(
              margin: EdgeInsets.only(left: 40), //margem do carrossel para a borda (ajustar se necessário)
              child: CarouselSlider( //Carrossel de fluxo de clientes
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: 173, //tamanho de cada itiem
                    viewportFraction: 0.47, //porção da tela que cada item ocupa
                    padEnds: false, //começa o carrossel na borda esquerda do container
                  ),
                  items: [ //conteúdo do carrossel (lista de Widgets)
                    CardEstoque(),
                    CardEstoque(),
                    CardEstoque(),
                    CardEstoque(),
                  ],
                ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Condições de temperatura e umidade...',
                    style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CarouselSlider( //Carrossel de fluxo de clientes
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  height: 276,
                ),
                items: [ //conteúdo do carrossel
                  CardTemperatura(cardSize: 276),
                  CardTemperatura(cardSize: 276),
                  CardTemperatura(cardSize: 276),
                ],
              ),
            ),
          ],
        ),
    );
  }
}