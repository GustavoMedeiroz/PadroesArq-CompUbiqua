import 'package:flutter/material.dart';

import '../core/models/sensor_model.dart';
import '../shared/utils/spectre_colors.dart';
import 'details_popup.dart';
import 'limits_popup.dart';

class SensorItem extends StatelessWidget {
  final SensorModel sensor;
  const SensorItem({super.key, required this.sensor});

  void mostrarTelaLimites (BuildContext context) {
    Navigator.pop(context); //Retirando o popup atual da tela para adicionar o popup de limites
    showDialog(
      context: context,
      barrierDismissible: true, // Isso permite que o usuário feche o dialog ao clicar fora dele
      builder: (context) {
      return LimitsPopup(); //chamando a tela para definir os limites de temp. e umidade
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
          Icons.lunch_dining,
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
                  'Estoque normal',
                  //Condição do estoque baseado nos limites do sensor e valor atual (talvez seja necessário fazer uma função pra isso?)
                  //Caso o valor atual seja menor que o limite, aparece 'Estoque crítico' em vermelho, por exemplo
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
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
        return DetailsPopup();
      },
    );
  }
}
