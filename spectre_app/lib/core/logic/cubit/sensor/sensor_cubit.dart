import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/page.dart';
import '../../../models/sensor_model.dart';
import '../../../services/http/sensor_service.dart';

part 'sensor_states.dart';

class SensorCubit extends Cubit<SensorState> {
  final SensorService sensorService;

  SensorCubit({required this.sensorService}) : super(SensorInitial());

  final List<SensorModel> _sensors = [];
  int _currentPage = 0;
  bool _isLastPage = false;

  Future<void> findAll() async {
    emit(SensorLoading());
    try {
      final Page<SensorModel> sensor =
          await sensorService.findAll(_currentPage);

      _sensors.clear();
      _sensors.addAll(sensor.content);
      _isLastPage = sensor.last;
      emit(SensorSuccess<List<SensorModel>>(_sensors));
    } catch (e) {
      if (e is SocketException) {
        emit(SensorError('No internet connection'));
      } else if (e is HttpException) {
        emit(SensorError('Server error: ${e.message}'));
      } else {
        emit(SensorError(e.toString()));
      }
    }
  }

  Future<void> fetchNextPage() async {
    if (_isLastPage) return;

    try {
      final sensor = await sensorService.findAll(++_currentPage);

      if (sensor.content.isNotEmpty) {
        _sensors.addAll(sensor.content);
      } else {
        _isLastPage = sensor.last;
        --_currentPage;
      }
      emit(SensorSuccess(List.from(_sensors)));
    } catch (e) {
      emit(SensorError(e.toString()));
    }
  }

  Future<void> findById(int id) async {
    emit(SensorLoading());

    try {
      final SensorModel sensor = await sensorService.findById(id);
      emit(SensorSuccess<SensorModel>(sensor));
    } catch (e) {
      if (e is SocketException) {
        emit(SensorError('No internet connection'));
      } else if (e is HttpException) {
        emit(SensorError('Server error: ${e.message}'));
      } else {
        emit(SensorError(e.toString()));
      }
    }
  }

  Future<void> create(SensorModel sensorModel) async {
    emit(SensorLoading());

    try {
      final SensorModel sensor = await sensorService.create(sensorModel);
      emit(SensorSuccess<SensorModel>(sensor));
    } catch (e) {
      if (e is SocketException) {
        emit(SensorError('No internet connection'));
      } else if (e is HttpException) {
        emit(SensorError('Server error: ${e.message}'));
      } else {
        emit(SensorError(e.toString()));
      }
    }
  }

  Future<void> update(SensorModel sensorModel) async {
    emit(SensorLoading());

    try {
      final SensorModel sensor = await sensorService.update(sensorModel);
      emit(SensorSuccess<SensorModel>(sensor));
    } catch (e) {
      if (e is SocketException) {
        emit(SensorError('No internet connection'));
      } else if (e is HttpException) {
        emit(SensorError('Server error: ${e.message}'));
      } else {
        emit(SensorError(e.toString()));
      }
    }
  }

  Future<void> delete(int id) async {
    emit(SensorLoading());

    try {
      await sensorService.delete(id);
      emit(SensorSuccess<void>(null));
    } catch (e) {
      if (e is SocketException) {
        emit(SensorError('No internet connection'));
      } else if (e is HttpException) {
        emit(SensorError('Server error: ${e.message}'));
      } else {
        emit(SensorError(e.toString()));
      }
    }
  }
}
