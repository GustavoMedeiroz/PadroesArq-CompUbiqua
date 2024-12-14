import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({super.key});

  checkStockStatus(double value, double min, double max) {
    if (value < min) {
      return mostrarLabelNormal();
    } else if (value > max) {
      return mostrarLabelCritico();
    } else {
      return mostrarLabelNormal();
    }
  }

  checkTemperatureStatus(double value, double min, double max) {
    if (value < min) {
    } else if (value > max) {
    } else {}
  }

  checkHumidityStatus(double value, double min) {
    if (value < min) {
    } else {}
  }

  mostrarLabelNormal () {
    Container(
          //Status Label
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
          ));
  }

  mostrarLabelCritico () {
    Container(
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
          ));
  }

  mostrarLabelExcesso () {
        Container(
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
          ));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
