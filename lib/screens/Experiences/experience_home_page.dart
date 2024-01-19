import '/widgets/bottombar.dart';

import './experience1_page.dart';
import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(
          currentIndex: 2,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  "Bienvenue sur",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0.06,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                      height: 80,
                    ),
                    const Text(
                      'BrainMusic',
                      style: TextStyle(
                        color: Color(0xFFE6E0E9),
                        fontSize: 50,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 502,
                  height: 127,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 30), // Réduit le padding vertical
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD0BCFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Couleur de fond du bouton
                        shadowColor: Colors.transparent, // Enlève l'ombre
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExperiencePage1()),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.music_note,
                            color: Colors.black,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Participer à l’expérience\n BrainMusic',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: 0.0001),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Qu’est-ce que BrainMusic ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Brain Music est une application permettant la mise en oeuvre d’expériences utilisant les ondes cérébrales afin d’entraîner des modèles d’intelligence artificielle.\n\nCelle-ci a été développée par un groupe d’étudiants-ingénieurs à Polytech Marseille dans le cadre d’un travail d’application industrielle.\n\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.50,
                        ),
                      ),
                      Text('Qu’est-ce qu’une onde cérébrale?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 12,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'L’activité neuro-électrique rythmique chez l’Homme est classée selon 5 gammes de fréquence :\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.50,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '• Les ondes Delta (entre 1 et 4 Hz) correspondent à un état de sommeil ou de méditation profond.\n• Les ondes Thêta (entre 4 et 8 Hz) caractérisent la mémorisation d’information et certains états de conscience modifiés (hypnose, sommeil paradoxal)\n• Les ondes Alpha (8 à 12 Hz) désignent un état de conscience apaisé et sont principalement émises lorsque le sujet a les yeux fermés\n• Les ondes Bêta (12 à 35 Hz) sont émises lors d’une activité mentale modérée. Ce sont les ondes principalement présentes dans notre état quotidien.\n• Enfin les ondes Gamma (35 à 80 Hz) se caractérisent par une activité mentale intense. (réflexion, calculs complexes)\n\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('Qu’est-ce qu’une intelligence artificielle ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Définition du Robert : “Ensemble des théories et des techniques développant des programmes informatiques complexes capables de simuler certains traits de l'intelligence humaine (raisonnement, apprentissage…).”L’intelligence artificielle utilisée par l’application sera basée sur de l’apprentissage automatique.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
