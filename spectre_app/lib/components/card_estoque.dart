import 'package:flutter/material.dart';

class CardEstoque extends StatelessWidget {
  const CardEstoque({super.key});


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
                              Icons.lunch_dining
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 9,
                              right: 9,
                              left: 27,
                            ),
                            child: Container (
                              alignment: Alignment.center,
                              width: 84,
                              height: 33,
                              decoration: BoxDecoration (
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
                              )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 63),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Frutas',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Acabará em breve!',
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