import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spectre_app/shared/utils/spectre_colors.dart';
import 'package:spectre_app/views/financial_report_page.dart';
import 'package:spectre_app/views/home_page.dart';
import 'package:spectre_app/views/notifications_page.dart';
import 'package:spectre_app/views/sensors_pager.dart';
import 'package:spectre_app/views/settings_page.dart';

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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SensorsPager(),
    FinancialReportPage(),
    NotificationsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
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
        currentIndex: _selectedIndex,
        selectedItemColor: SpectreColors.spectrePurple,
        unselectedItemColor: SpectreColors.spectreWhite,
        onTap: _onItemTapped,
        selectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
