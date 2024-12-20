import 'package:flutter/material.dart';

import 'sensors_filter.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final bool hasFilter;

  const PageTitle({
    super.key,
    required this.title,
    required this.hasFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(236, 236, 236, 0.6),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 21,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            hasFilter ? SensorsFilter() : Container(),
          ],
        ),
      ),
    );
  }
}
