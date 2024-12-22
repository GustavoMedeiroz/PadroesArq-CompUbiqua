import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:spectre_app/components/card_estoque.dart';
import 'package:spectre_app/components/card_temperatura.dart';
import 'package:spectre_app/core/models/sensor_model.dart';
import 'package:spectre_app/core/services/http/sensor_service.dart';
import '../components/card_fluxo.dart';
import '../components/page_title.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  Future<SensorModel> _fetchSensorById(int id) async {
    return await SensorService().findById(id);
  }

  final SensorModel sensor = SensorModel(
    id: 1,
    name: 'name',
    currentValue: 6,
    minValue: 2,
    maxValue: 2,
    type: 'type',
    status: 'status',
  );

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(241, 241, 241, 1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                PageTitle(title: 'Boa noite, Gustavo!', hasFilter: false),
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
                CarouselSlider(
                  //Carrossel de fluxo de clientes
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    disableCenter: true,
                    height: 265,
                  ),
                  items: [
                    //conteúdo do carrossel
                    CardFluxo(colorScheme: 1, data: 'HOJE'),
                    //importando card do card_fluxo.dart
                    CardFluxo(colorScheme: 2, data: 'SEMANA'),
                    CardFluxo(colorScheme: 3, data: 'MÊS'),
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
                  margin: EdgeInsets.only(left: 40),
                  //margem do carrossel para a borda (ajustar se necessário)
                  child: CarouselSlider(
                    //Carrossel de fluxo de clientes
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: 173,
                      //tamanho de cada item
                      viewportFraction: 0.47,
                      //porção da tela que cada item ocupa
                      padEnds:
                          false, //começa o carrossel na borda esquerda do container
                    ),
                    items: [
                      //conteúdo do carrossel (lista de Widgets)
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(1), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardEstoque(sensor: snapshot.data!);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(3), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardEstoque(sensor: snapshot.data!);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(6), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardEstoque(sensor: snapshot.data!);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(7), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardEstoque(sensor: snapshot.data!);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(12), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardEstoque(sensor: snapshot.data!);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(13), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardEstoque(sensor: snapshot.data!);
                          } else {
                            return Container();
                          }
                        },
                      ),
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
                  child: CarouselSlider(
                    //Carrossel de fluxo de clientes
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      disableCenter: true,
                      height: 276,
                    ),
                    items: [
                      //conteúdo do carrossel
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(2), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardTemperatura(sensor: snapshot.data!, cardSize: 286,);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(4), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardTemperatura(sensor: snapshot.data!, cardSize: 286,);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(8), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardTemperatura(sensor: snapshot.data!, cardSize: 286,);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(9), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardTemperatura(sensor: snapshot.data!, cardSize: 286,);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(11), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardTemperatura(sensor: snapshot.data!, cardSize: 286,);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      FutureBuilder<SensorModel>(
                        future: _fetchSensorById(14), // Sensor específico
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erro ao carregar sensor');
                          } else if (snapshot.hasData) {
                            return CardTemperatura(sensor: snapshot.data!, cardSize: 286,);
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
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
