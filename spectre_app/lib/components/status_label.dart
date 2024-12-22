import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({super.key});

  String stockSubtitle(double value, double min, double max) {
    if (value < min) {
      return 'Falta de estoque!';
    } else if (value > max) {
      return 'Excesso de estoque!';
    } else {
      return 'Estoque normal';
    }
  }

  checkStockStatus(double value, double min, double max) {
    if (value < min) {
      return mostrarLabelCritico();
    } else if (value > max) {
      return mostrarLabelExcesso();
    } else {
      return mostrarLabelNormal();
    }
  }

  checkTemperatureAndHumidityStatus(double tempValue, double tempMin, double tempMax, double humValue, double humMin) {
    if (tempValue < tempMin || humValue < humMin) {
      return mostrarLabelCritico();
    } else if (tempValue > tempMax) {
      return mostrarLabelCritico();
    } else {
      return mostrarLabelNormal();
    }
  }

  checkTemperatureStatus(double tempValue, double tempMin, double tempMax) {
    if (tempValue < tempMin) {
      return mostrarLabelCritico();
    } else if (tempValue > tempMax) {
      return mostrarLabelCritico();
    } else {
      return mostrarLabelNormal();
    }
  }

  mostrarLabelNormal () {
    return Container(
      alignment: Alignment.center,
      width: 84,
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(41),
        color: Color.fromRGBO(44, 155, 217, 0.1),
      ),
      child: Text(
        'NORMAL',
        style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  mostrarLabelCritico () {
    return Container(
      alignment: Alignment.center,
      width: 84,
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(41),
        color: Color.fromRGBO(255, 0, 0, 0.1),
      ),
      child: Text(
        'CRÍTICO',
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  mostrarLabelExcesso () {
    return Container(
      alignment: Alignment.center,
      width: 84,
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(41),
        color: Color.fromRGBO(70, 137, 28, 0.1),
      ),
      child: Text(
        'EXCESSO',
        style: TextStyle(
          color: Colors.green,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
