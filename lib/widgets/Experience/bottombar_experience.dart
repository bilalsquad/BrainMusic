import 'package:flutter/material.dart';

class BotBarExp extends StatelessWidget {
  final Widget pageSuivante;

  const BotBarExp({Key? key, required this.pageSuivante}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Retour',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD0BCFF),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.10,
                ),
              )),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pageSuivante)),
              child: const Text(
                'Suivant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD0BCFF),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.10,
                ),
              )),
        ],
      ),
    );
  }
}
