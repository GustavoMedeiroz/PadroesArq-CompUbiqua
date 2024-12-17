
import 'package:flutter/material.dart';

class SensorsFilter extends StatelessWidget {
  const SensorsFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //FILTRO DE BUSCA, podemos deixar por último (https://www.youtube.com/watch?v=ZHdg2kfKmjI)
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 20,
      ),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.tune),
          hintText: 'Buscar',
          hintStyle: TextStyle(
            color: Color.fromRGBO(96, 96, 96, 0.5),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Color.fromRGBO(96, 96, 96, 5),
            ),
          ),
        ),
      ),
    );
  }
}
