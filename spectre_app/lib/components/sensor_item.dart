import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'status_label.dart';
import '../shared/utils/spectre_colors.dart';

class SensorItem extends StatelessWidget {
  const SensorItem({super.key});

  // PARA RECEBER OS DADOS DO SENSOR:
  // const SensorItem({super.key, required this.sensor});
  // final SensorModel sensor;
  // + Passar o Sensor como parâmetro ao chamar um SensorItem no sensors_page

  // RASCUNHO: TALVEZ NÃO SERÁ USADO PQ VOU CONSTRUIR O POPUP DENTRO DESSE COMPONENT MESMO, NÃO PRECISA DE ROTA
  //void _abrirPopUp (BuildContext context) {
  //  Navigator.of(context).pushNamed(AppRoutes.STOCKDETAILS); //navega para a rota
  //  arguments: sensor (passar o sensor atual para a rota)
  //}

  /////////// LISTVIEW ///////////

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
        onTap: () => _mostrarPopUp(context),
      ),
    );
  }

  ///////// POP-UP /////////
  
  void _mostrarPopUp(BuildContext context) {
    showPopupCard(
        //MOSTRANDO O POP-UP DO SENSOR
        context: context,
        builder: (context) {
          return Stack(
            children: [
              // Adicionando um filtro de desfoque para reduzir a opacidade
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5), // Opacidade de 50%
                ),
              ),
              Center(
                child: PopupCard(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), //border de cada Card
                  ),
                  elevation: 5,
                  child: SizedBox(
                    height: 265,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 21,
                        vertical: 24,
                      ),
                      child: Column(
                        //coluna para envolver os textos do título do Card
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //alinhando à esquerda
                        children: [
                          Row(
                            //Row da temperatura, descrição e estado (CRÍTICO, NORMAL...)
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '26°C:',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Temperatura ambiente',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        color: Color.fromRGBO(0, 0, 0, 60),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              StatusLabel().checkStockStatus(2, 3, 7),
                            ],
                          ),
                          SizedBox(height: 71),
                          Column(
                            //Coluna da qntd de clientes e horários de pico
                            children: [
                              Row(
                                //quantidade de clients
                                children: [
                                  Expanded(
                                    //Expanded para que o primeiro Text ocupe todo o espaço diponível
                                    child: Text(
                                      'Mínima:',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(), //Spacer para empurrar o segundo text para a borda direita da Row
                                  Text(
                                    '+15°C',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                //horários de pico
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Máxima:',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '+30°C',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Color.fromRGBO(0, 0, 0, 0.5)),
                            ],
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.water_drop_outlined,
                                  color: Colors.black,
                                  size: 29,
                                ), //ícone do carrinho
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '47% de Umidade Relativa', //Valor Atual de Umidade
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Normal', //Condição atual de umidade referente ao limite
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromRGBO(0, 0, 0, 0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 29,
                                ), //ícone da seta
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
