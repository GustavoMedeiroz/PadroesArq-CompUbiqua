part of 'sensor_cubit.dart';

abstract class SensorStates {}

class SensorInitial extends SensorStates {}

class SensorLoading extends SensorStates {}

class SensorSuccess<T> extends SensorStates {
  final T data;

  SensorSuccess(this.data);
}

class SensorError extends SensorStates {
  final String message;

  SensorError(this.message);
}