import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

//CLASSE RASCUNHO (IGNORAR)
//CLASSE RASCUNHO (IGNORAR)
//CLASSE RASCUNHO (IGNORAR)
//CLASSE RASCUNHO (IGNORAR)
class StockDetails extends StatelessWidget {
  const StockDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //final sensor = ModalRoute.of(context)!.settings.arguments as SensorModel

    return PopupCard(
      child: SizedBox(
        height: 265,
        width: 320,
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), //border de cada Card
          ),
          child: Column(
            children: [
              Text('Detalhes do item'),
            ],
          ),
        ),
      ),
    );
  }
}
