import 'package:flutter/material.dart';

import '../components/card_temperatura.dart';
import '../components/page_title.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(241, 241, 241, 1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PageTitle(title: 'Temperatura e Umidade', hasFilter: true),
                SizedBox(
                  height: 700,
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
          ),
        ),
      ),
    );
  }
}