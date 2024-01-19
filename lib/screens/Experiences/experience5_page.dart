// ... Autres importations

import './../../widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'experience6_page.dart';

class ExperiencePage5 extends StatelessWidget {
  const ExperiencePage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          // Ajout du bouton ElevatedButton ici
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExperiencePage6()),
            ),
            child: Container(
              width: 328, // Largeur fixe de 328px
              height: 120, // Hauteur fixe de 120px
              margin: const EdgeInsets.only(top: 289), // Positionnement

              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFD0BCFF),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Rayon des bords de 8px
                ),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.music_note,
                    color: Colors.black,
                    size: 40,
                  ),
                  SizedBox(
                    width: 8, // Espace spécifié de 8px
                  ),
                  Expanded(
                    child: Text(
                      'Commencer l’expérience',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        letterSpacing: 0.0001,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
