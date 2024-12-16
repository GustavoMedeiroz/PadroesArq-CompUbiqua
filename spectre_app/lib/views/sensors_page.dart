import 'package:flutter/material.dart';
import 'package:spectre_app/core/models/sensor_model.dart';
import 'package:spectre_app/shared/utils/spectre_colors.dart';
import '../components/sensor_item.dart';

class SensorsPage extends StatelessWidget {
  SensorsPage({super.key});

  final List<SensorModel> _sensors = [];

  //setState(() {
  //  _sensors.add(newSensor);
  //});

  //Navigator.of(context).pop();
  //}

  void _abrirSensorForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Text('ignore isso'); //TransactionForm(_addSensor);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //definindo um Scaffold nessa tela para poder usar o FloatingActionButton
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(247, 247, 247, 1),
                Color.fromRGBO(236, 236, 236, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
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
                    Padding(
                      //TÍTULO DA PÁGINA
                      padding: const EdgeInsets.only(left: 28),
                      child: Text(
                        'Sensores Ativos no Estoque',
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      //FILTRO DE BUSCA, podemos deixar por último (https://www.youtube.com/watch?v=ZHdg2kfKmjI)
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
              SizedBox(
                //CONSTRUINDO A LISTA DE SENSORES DE PESO DO ESTOQUE
                height: 800, // ainda vou ajustar melhor esse tamanho
                child: ListView.builder( //LISTA DOS CARDS
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return SensorItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        //Botão para adicionar sensores
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
          BoxShadow(
            color: SpectreColors.spectrePurple,
            blurRadius: 20,
            spreadRadius: 0.5,
          )
        ]),
        child: FloatingActionButton(
          elevation: 5,
          foregroundColor: Colors.white,
          backgroundColor: SpectreColors.spectrePurple,
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 30),
          onPressed: () => _abrirSensorForm(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
