import '../../widgets/Bouton.dart';
import './../../widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'experience5_page.dart';
import 'experience_home_page.dart';

class ExperiencePage4 extends StatelessWidget {
  const ExperiencePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 214,
            height: 40,
            child: GenericButton(
              buttonText: 'Se connecter à MUSE-001',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExperiencePage5()),
                );
              },
              buttonTextColor: const Color(0xFF381E72),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 214,
            height: 40,
            child: GenericButton(
              buttonText: 'Se connecter à MUSE-002',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExperiencePage5()),
                );
              },
              buttonTextColor: const Color(0xFF381E72),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 214,
            height: 40,
            child: GenericButton(
              buttonText: 'Se connecter à MUSE-003',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExperiencePage5()),
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
