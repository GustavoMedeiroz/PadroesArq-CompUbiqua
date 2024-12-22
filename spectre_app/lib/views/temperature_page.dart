import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/card_temperatura.dart';
import '../components/page_title.dart';
import '../core/logic/cubit/sensor/sensor_cubit.dart';
import '../core/services/http/sensor_service.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final _cubit = SensorCubit(sensorService: SensorService());

  @override
  void initState() {
    super.initState();
    _refreshTemperatures();
  }

  Future<void> _refreshTemperatures() async {
    await _cubit.findAll(List.from(['TEMPERATURE']));
  }

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
          child: BlocBuilder<SensorCubit, SensorState>(
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
                    child: RefreshIndicator(
                      onRefresh: _refreshTemperatures,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          children: [
                            Wrap(
                              children: [
                                PageTitle(
                                  title: 'Sensores ativos de Temperatura',
                                  hasFilter: true,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.data.length,
                                  itemBuilder: (ctx, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 28,
                                        right: 28,
                                        bottom: 10,
                                      ),
                                      child: CardTemperatura(
                                        cardSize: 266,
                                        sensor: state.data[index],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 100),
                                loadingIndicatorWidget(_cubit),
                              ],
                            )
                          ],
                        ),
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
      ),
    );
  }

  Widget loadingIndicatorWidget(SensorCubit cubit) {
    return BlocBuilder<SensorCubit, SensorState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is! SensorLoadingMore &&
            !(cubit.currentPage + 1 == cubit.totalPages)) {
          return Center(
            child: ElevatedButton(
              onPressed: () => _cubit.fetchNextPage(List.empty()),
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
