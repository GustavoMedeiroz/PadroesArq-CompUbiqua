import 'package:flutter/material.dart';
import 'package:spectre_app/components/stock_details.dart';
import 'package:spectre_app/views/notifications_page.dart';
import 'package:spectre_app/views/sensors_page.dart';
import 'package:spectre_app/views/settings_page.dart';
import 'package:spectre_app/shared/utils/app_router.dart';
import 'package:spectre_app/views/tabs_screen.dart';
import 'package:spectre_app/views/temperature_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Inter', //Definindo as fontes
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 21,
            fontFamily: 'OpenSans',
          )
        )
      ),
      routes:  {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.STOCK: (ctx) => SensorsPage(),
        AppRoutes.NOTIFICATIONS: (ctx) => NotificationsPage(),
        AppRoutes.SETTINGS: (ctx) => SettingsPage(),
        AppRoutes.TEMPERATURE: (ctx) => TemperaturePage(),
      },
    );
  }
}

