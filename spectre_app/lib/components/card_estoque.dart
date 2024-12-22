import 'package:flutter/material.dart';
import 'package:spectre_app/components/status_label.dart';
import 'package:spectre_app/core/models/sensor_model.dart';

class CardEstoque extends StatelessWidget {
  final SensorModel sensor;

  const CardEstoque({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: SizedBox(
        height: 34,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 12,
                        left: 16,
                      ),
                      child: Icon(
                        size: 26,
                        Icons.sensors,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 9,
                        right: 9,
                        left: 27,
                      ),
                      child: StatusLabel().checkStockStatus(sensor.currentValue, sensor.minValue, sensor.maxValue),
                    ),
                  ],
                ),
                SizedBox(height: 63),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sensor.name,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      StatusLabel().stockSubtitle(sensor.currentValue, sensor.minValue, sensor.maxValue),
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () => {},
          ),
        ),
      ),
    );
  }
}