import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../models/page.dart';
import '../../../models/sensor_model.dart';
import '../../../services/http/sensor_service.dart';

part 'sensor_states.dart';

class SensorCubit extends Cubit<SensorStates> {
  SensorCubit() : super(SensorInitial());
  final SensorService _sensorService = SensorService();

  final List<SensorModel> _sensors = [];
  int _page = 0;
  bool _isFetching = false;
  bool _isLastPage = false;

  Future<void> findAll() async {
    emit(SensorLoading());
    try {
      final Page<SensorModel> sensor =
          await _sensorService.findAll(page: _page);
      print('SensorCubit.findAll: $_page');

      _sensors.addAll(sensor.content);
      print('SensorCubit.findAll: ${_sensors.length}');
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
    if (_isFetching || _isLastPage) return;

    _isFetching = true;

    try {
      final sensor = await _sensorService.findAll(page: _page);

      if (sensor.content.isNotEmpty) {
        _sensors.addAll(sensor.content);
        emit(SensorSuccess(_sensors));
      }

      _isLastPage = sensor.last;
      _page++;
    } catch (e) {
      emit(SensorError(e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> findById(int id) async {
    emit(SensorLoading());

    try {
      final SensorModel sensor = await _sensorService.findById(id);
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
      final SensorModel sensor = await _sensorService.create(sensorModel);
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
      final SensorModel sensor = await _sensorService.update(sensorModel);
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
      await _sensorService.delete(id);
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
