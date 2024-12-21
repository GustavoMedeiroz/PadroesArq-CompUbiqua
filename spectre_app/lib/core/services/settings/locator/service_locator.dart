import 'package:get_it/get_it.dart';

class ServiceLocator {
  ServiceLocator._();

  static GetIt get locator => GetIt.instance;

  static Future<void> initServiceLocator() async {
    await _setup();
    _registerCubits();
  }

  static Future<void> _setup() async {
    // GetIt.I.registerLazySingleton<SensorService>(() => SensorService());
  }

  static void _registerCubits() async {
    // GetIt.I.registerFactory<SensorCubit>(() => SensorCubit(locator()));
  }
}
