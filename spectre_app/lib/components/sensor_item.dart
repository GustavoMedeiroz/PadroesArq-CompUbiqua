import 'package:flutter/material.dart';

import '../core/models/sensor_model.dart';
import '../shared/utils/spectre_colors.dart';
import 'details_popup_stock.dart';
import 'limits_popup_stock.dart';
import 'status_label.dart';


class SensorItem extends StatelessWidget {
  final SensorModel sensor;
  const SensorItem({super.key, required this.sensor});
  

  void mostrarTelaLimites (BuildContext context) {
    Navigator.pop(context); //Retirando o popup atual da tela para adicionar o popup de limites
    showDialog(
      context: context,
      barrierDismissible: true, // Isso permite que o usuário feche o dialog ao clicar fora dele
      builder: (context) {
      return LimitsPopup(sensor: sensor); // Passando o sensor atual para o LimitsPopup
      }
    );
  }

  // PARA RECEBER OS DADOS DO SENSOR:
  // const SensorItem({super.key, required this.sensor});
  // final SensorModel sensor;
  // + Passar o Sensor como parâmetro ao chamar um SensorItem no sensors_page

  // RASCUNHO: TALVEZ NÃO SERÁ USADO PQ VOU CONSTRUIR O POPUP DENTRO DESSE COMPONENT MESMO, NÃO PRECISA DE ROTA
  //void _abrirPopUp (BuildContext context) {
  //  Navigator.of(context).pushNamed(AppRoutes.STOCKDETAILS); //navega para a rota
  //  arguments: sensor (passar o sensor atual para a rota)
  //}

   //////////////////////////////////////////////////////// LISTVIEW ////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Card(
      //CARD DO LISTVIEW
      color: SpectreColors.spectreWhite,
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: ListTile(
        leading: Icon(
          //ÍCONE DO SENSOR (o usuário vai escolher o ícone?? Como implementar isso??)
          Icons.sensors,
          size: 26,
        ),
        title: Text(
          sensor.name, //Nome do sensor
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: 13,
                ),
                SizedBox(width: 3),
                Text(
                  StatusLabel().stockSubtitle(sensor.currentValue, sensor.minValue, sensor.maxValue),
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: sensor.currentValue < sensor.minValue
                        ? Colors.red // Falta de estoque
                        : sensor.currentValue > sensor.maxValue
                            ? Colors.green // Excesso de estoque
                            : Color.fromRGBO(0, 0, 0, 0.6), // Estoque normal
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Icon(
          Icons.more_horiz,
          size: 30,
        ),
        onTap: () => _mostrarPopUp(context),
      ),
    );
  }


  //////////////////////////////////////////////////////// POP-UP ////////////////////////////////////////////////////////


  void _mostrarPopUp(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Isso permite que o usuário feche o dialog ao clicar fora dele
      builder: (context) {
        return DetailsPopup(sensor: sensor);
      },
    );
  }
}
