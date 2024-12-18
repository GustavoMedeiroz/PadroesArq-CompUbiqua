import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/page_title.dart';
import '../components/sensor_item.dart';
import '../core/logic/cubit/sensor/sensor_cubit.dart';
import '../core/services/http/sensor_service.dart';

class SensorsPage extends StatefulWidget {
  const SensorsPage({super.key});

  @override
  State<SensorsPage> createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  final _cubit = SensorCubit(sensorService: SensorService());

  // void _abrirSensorForm(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (_) {
  //       return Text('ignore isso'); //TransactionForm(_addSensor);
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _cubit.findAll();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SensorCubit, SensorState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is SensorLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SensorSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Wrap(
                          children: [
                            PageTitle(title: 'Sensores Ativos no Estoque'),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.data.length,
                              itemBuilder: (context, index) => SensorItem(
                                sensor: state.data[index],
                              ),
                            ),
                            SizedBox(height: 100),
                            loadingIndicatorWidget(_cubit),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is SensorError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget loadingIndicatorWidget(SensorCubit cubit) {
    return BlocBuilder<SensorCubit, SensorState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is! SensorLoadingMore && !(cubit.currentPage + 1 == cubit.totalPages)) {
          return Center(
            child: ElevatedButton(
              onPressed: () => _cubit.fetchNextPage(),
              child: Text('Carregar mais'),
            ),
          );
        }
        if (state is SensorLoadingMore) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}