// ... Autres importations

import '../../widgets/Bouton.dart';
import './../../widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'experience_home_page.dart';

class ExperiencePage7 extends StatelessWidget {
  const ExperiencePage7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Bravo vous avez complété l’expérience !',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 95,
          ),
          Container(
            width: 185,
            height: 40,
            child: GenericButton(
              buttonText: 'Terminer l’expérience ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExperiencePage()),
                );
              },
              buttonTextColor: const Color(0xFF381E72),
            ),
          ),
        ]),
      ),
    );
  }
}