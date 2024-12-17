import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/sensor_item.dart';
import '../components/sensors_filter.dart';
import '../core/logic/cubit/sensor/sensor_cubit.dart';

class SensorsPage extends StatefulWidget {
  const SensorsPage({super.key});

  @override
  State<SensorsPage> createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  final cubit = SensorCubit();

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
  void initState() {
    super.initState();
    cubit.findAll();
  }

  // TODO: implement Infinite Scroll
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //definindo um Scaffold nessa tela para poder usar o FloatingActionButton
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
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
                // height: 126,
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
                    SensorsFilter()
                  ],
                ),
              ),
            ),
            BlocBuilder<SensorCubit, SensorStates>(
              bloc: cubit,
              builder: (context, state) {
                if (state is SensorInitial) {
                  return SliverFillRemaining(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SensorSuccess) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return SensorItem(
                          sensor: state.data[index],
                        );
                      },
                      childCount: state.data.length,
                    ),
                  );
                } else if (state is SensorError) {
                  return SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.not_interested,
                          size: 30.0,
                        ),
                        const SizedBox(
                          height: 16.00,
                        ),
                        Text(state.message),
                      ],
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(child: Container());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
