import 'package:musicbrainflutter/screens/Experiences/experience2_page.dart';
import 'package:musicbrainflutter/screens/Experiences/experience3_page.dart';
import 'package:musicbrainflutter/screens/Experiences/experience4_page.dart';

import '../../widgets/Bouton.dart';
import '../../widgets/progression_barre.dart';
import './../../widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'experience5_page.dart';
import 'experience_home_page.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ExperiencePage3 extends StatelessWidget {
  const ExperiencePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      body: Center(
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const SizedBox(
          //       height: 245,
          //     ),
          //     Container(
          //       width: double.infinity,
          //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //       child: const Text(
          //         'Veuillez activer le bluetooth afin de vous connecter au dispositif.',
          //         style: TextStyle(
          //           fontFamily: 'Roboto',
          //           fontWeight: FontWeight.w400,
          //           fontSize: 16,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     ElevatedButton(
          //       onPressed: () async {
          //         // Vérifier si le Bluetooth est activé
          //         bool isBluetoothEnabled = await FlutterBlue.instance.isOn;
          //         if (isBluetoothEnabled) {
          //           print('Bluetooth activé');
          //         } else {
          //           print('Bluetooth désactivé');
          //         }
          //       },
          //       child: Text('Vérifier Bluetooth'),
          //     ),
          //     const SizedBox(
          //       height: 303,
          //     ),
          //     const PageProgressIndicator(
          //       currentPage: 3,
          //       totalPage: 3,
          //     ),
          //     GenericButtonBV(
          //       buttonText: 'Retour',
          //       onPressed: () async {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const ExperiencePage2(),
          //           ),
          //         );
          //       },
          //       buttonTextColor: const Color(0xFFD0BCFF),
          //       borderColor: const Color(0xFF2e2e2e),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
