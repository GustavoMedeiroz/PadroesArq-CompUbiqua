import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

class LimitsPopupTemp extends StatefulWidget {
  const LimitsPopupTemp({super.key});

  @override
  State<LimitsPopupTemp> createState() => _LimitsPopupState();
}

  class _LimitsPopupState extends State<LimitsPopupTemp> {

  late TextEditingController controller; //controller para os valores a serem alterados
  String value = ''; //novo valor passado pelo usuário
  String valueMinimoTemp = ''; //novo valor passado pelo usuário para limite mínimo
  String valueMaximoTemp = ''; //novo valor passado pelo usuário para limite máximo
  String valueMinimoUmidade = ''; //novo valor passado pelo usuário para peso médio

  @override
  void initState() { //inicializando o controller
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() { //removendo o controller
    controller.dispose();
    super.dispose();
  }

  void _confirmarAlteracoes() {
    //confirmar envio do formulário -> alterar as informações no banco
  }

  // Método para criar parte do card
  inputValue(BuildContext context, String placeholder, String value, String id) {
    //acrescentar nos parâmetros algo para verificar o tipo de valor a ser alterado no banco
    return Material(
      color: Colors.white,
      child: InkWell(
        child: Row(
          //quantidade de clients
          children: [
            Expanded(
              flex: 5,
              //Expanded para que o primeiro Text ocupe todo o espaço diponível
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeholder, //passando a String recebida
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    value.toString(), //convertendo o valor para String
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), //Spacer para empurrar o segundo text para a borda direita da Row
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
        onTap: () async { //espera o valor inserido pelo usuário
          final newValue = await openDialog(context, placeholder); //passando o contexto e a descrição do valor a ser alterado
          if (newValue == null || newValue.isEmpty) return;

          setState(() {
            if (id == 'minimo') {
              // Atualiza o valor do limite mínimo
              valueMinimoTemp = newValue; // Adiciona uma variável para o limite mínimo
            } else if (id == 'maximo') {
              // Atualiza o valor do limite máximo
              valueMaximoTemp = newValue; // Adicione uma variável para o limite máximo
            } else if (id == 'umidade') {
              // Atualiza o valor do peso médio
              valueMinimoUmidade = newValue; // Adicione uma variável para o peso médio
            }
          });
        }
      ),
    );
  }

  Future<String?> openDialog(BuildContext context, String title) {
    return showDialog<String?>( //Dialog para alterar o valor de alguma propriedade do sensor
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Insira o novo valor'
        ),
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () => submit(context),
          child: Text('CONCLUIR'),
        ),
      ],
    ),
  );
  }

  submit(BuildContext context) {
    return Navigator.of(context).pop(controller.text); //esconder o Dialog e passando o valor
  }

  _mostrarBotaoConfirma() {
    return Expanded(
      flex: 3,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => _confirmarAlteracoes(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.sensors,
                color: Colors.black,
                size: 34,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Confirmar alterações',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
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
      ),
    );
  }


  // Builder //


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: PopupCard(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), //border de cada Card
            ),
            elevation: 5,
            child: SizedBox(
              height: 320,
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
                      //Row da temperatura, descrição e estado
                      //Estado (CRÍTICO, NORMAL...) é dado pelo status_label.dart
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ambiente', //NOME DO SENSOR DE TEMP
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Valores atuais dos sensores',
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
                      ],
                    ),
                    SizedBox(height: 25),
                    Column(
                      //Coluna da qntd de clientes e horários de pico
                      children: [
                        inputValue(
                          //chamando a função do campo de alterar valor
                          context,
                          'Limite mínimo (°C):',
                          valueMinimoTemp, //passar o valor de limite mínimo do sensor
                          'minimo', // identificador para limite mínimo
                        ),
                        SizedBox(height: 10),
                        inputValue(
                          context,
                          'Limite máximo (°C):',
                          valueMaximoTemp, //passar o valor de limite máximo do sensor
                          'maximo', // identificador para limite máximo
                        ),
                        SizedBox(height: 10),
                        inputValue(
                          context,
                          'Limite mínimo (Umidade do ar):',
                          valueMinimoUmidade, //passar o valor do produto registrado no sensor
                          'umidade', // identificador para peso médio
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          child: Divider(color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                      ],
                    ),
                    _mostrarBotaoConfirma(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
