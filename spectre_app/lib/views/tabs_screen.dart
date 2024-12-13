import 'package:flutter/material.dart';
import 'package:spectre_app/views/dashboard_page.dart';
import 'package:spectre_app/views/financial_report_page.dart';
import 'package:spectre_app/views/notifications_page.dart';
import 'package:spectre_app/views/sensors_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spectre_app/views/settings_page.dart';
import '../shared/utils/spectre_colors.dart';

class TabsScreen extends StatefulWidget {  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
  //uma tela será definida como uma lista de maps com uma string e objeto como chave (hora será string e hora será widget)
    { 'title': 'dashboard', 'screen': DashboardPage() },
    { 'title': 'sensors', 'screen': SensorsPage() },
    { 'title': 'financial', 'screen': FinancialReportPage() },
    { 'title': 'notifications', 'screen': NotificationsPage() },
    { 'title': 'settings', 'screen': SettingsPage() },
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

 //além de ser uma tela, irá possuir as tabs para navegar para outras telas
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String,
          ),
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: SpectreColors.spectreWhite,
        unselectedItemColor: SpectreColors.spectreWhite, //cor do ícone não selecionado
        selectedItemColor: SpectreColors.spectrePurple, //cor do ícone selecionado
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting, //aumenta o tamanho do ícone selecionado (animação)
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/nav_bar_home.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/nav_bar_shield.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/nav_bar_document.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/nav_bar_notification.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/nav_bar_setting.svg'),
            label: '',
          ),
        ],
      ),
    );
  }
}