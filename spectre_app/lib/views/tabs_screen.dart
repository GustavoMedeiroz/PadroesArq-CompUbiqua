import 'package:flutter/material.dart';
import 'package:spectre_app/views/dashboard_page.dart';
import 'package:spectre_app/views/financial_report_page.dart';
import 'package:spectre_app/views/notifications_page.dart';
import 'package:spectre_app/views/sensors_page.dart';
import 'package:spectre_app/views/settings_page.dart';
import 'package:spectre_app/views/temperature_page.dart';

import '../shared/utils/spectre_colors.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedScreenIndex = 0;
  final List<Widget> _screens = [
    //uma tela será definida como uma lista de maps com uma string e objeto como chave (hora será string e hora será widget)
    DashboardPage(),
    SensorsPage(),
    TemperaturePage(),
    NotificationsPage(),
    SettingsPage(),
    FinancialReportPage(),
    //ainda não existe o ícone (provavelmente não vamos implementar isso)
  ];

  _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  //além de ser uma tela, irá possuir as tabs para navegar para outras telas
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(247, 247, 247, 1),
                Color.fromRGBO(236, 236, 236, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: _screens[
              selectedScreenIndex] //seleciona a tela baseada no index da BottomTabBar
          ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        elevation: 10,
        unselectedItemColor: SpectreColors.spectreWhite,
        //cor do ícone não selecionado
        selectedItemColor: SpectreColors.spectrePurple,
        //cor do ícone selecionado
        currentIndex: selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        //aumenta o tamanho do ícone selecionado (animação)
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home_rounded,
              color: selectedScreenIndex == 0
                  ? SpectreColors.spectrePurple
                  : Colors.black,
              size: 27,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.pallet,
              color: selectedScreenIndex == 1
                  ? SpectreColors.spectrePurple
                  : Colors.black,
              size: 27,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.device_thermostat,
              color: selectedScreenIndex == 2
                  ? SpectreColors.spectrePurple
                  : Colors.black,
              size: 27,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: selectedScreenIndex == 3
                  ? SpectreColors.spectrePurple
                  : Colors.black,
              size: 27,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.settings,
              color: selectedScreenIndex == 4
                  ? SpectreColors.spectrePurple
                  : Colors.black,
              size: 27,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
