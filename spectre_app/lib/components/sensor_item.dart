import 'package:flutter/material.dart';
import '../core/models/sensor_model.dart';
import '../shared/utils/spectre_colors.dart';

class SensorItem extends StatelessWidget {
  const SensorItem({super.key});

  // PARA IMPLEMENTAR COM DADOS DINÂMICOS:
  // const SensorItem({super.key, required this.sensor});
  // final SensorModel sensor;
  // + Passar o Sensor como parâmetro ao chamar um SensorItem no sensors_page

  @override
  Widget build(BuildContext context) {
    return Card(
      color: SpectreColors.spectreWhite,
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: ListTile(
        leading: Icon(
          Icons.lunch_dining,
          size: 26,
        ),
        title: Text(
          'Carnes', //Nome do sensor
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
      ),
    );
  }
}
