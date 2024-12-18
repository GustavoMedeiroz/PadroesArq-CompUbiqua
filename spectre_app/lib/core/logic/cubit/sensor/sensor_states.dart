part of 'sensor_cubit.dart';

abstract class SensorState extends Equatable {
  const SensorState();

  @override
  List<Object> get props => [];
}

class SensorInitial extends SensorState {}

class SensorLoading extends SensorState {}

class SensorSuccess<T> extends SensorState {
  final T data;

  const SensorSuccess(this.data);
}

class SensorLoadingMore extends SensorSuccess {
  const SensorLoadingMore(super.data);
}

class SensorError extends SensorState {
  final String message;

  const SensorError(this.message);
}