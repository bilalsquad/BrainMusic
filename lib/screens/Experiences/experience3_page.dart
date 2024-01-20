// import 'package:flutter_blue/flutter_blue.dart';
import 'package:musicbrainflutter/screens/Experiences/experience4_page.dart';
import 'package:musicbrainflutter/widgets/Experience/appbar.dart';
import 'package:musicbrainflutter/widgets/Experience/bottombar_experience.dart';
import '../../widgets/Experience/progression_barre.dart';
import 'package:flutter/material.dart';

class ExperiencePage3 extends StatelessWidget {
  const ExperiencePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BotBarExp(pageSuivante: ExperiencePage4()),
      appBar: const AppBar1(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 70,
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                    'Veuillez activer le bluetooth afin de vous connecter au dispositif.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Créez une instance de FlutterBlue
                  // FlutterBlue flutterBlue = FlutterBlue.instance;

                  // Vérifiez si le Bluetooth est activé
                  // var isOn = await flutterBlue.isOn;
                  // if (!isOn) {
                  //   // Informer l'utilisateur que le Bluetooth n'est pas activé
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text('Bluetooth désactivé'),
                  //         content: Text(
                  //             'Veuillez activer le Bluetooth pour vous connecter au dispositif.'),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             child: Text('Paramètres'),
                  //             onPressed: () {
                  //               // Ouvre les paramètres Bluetooth du système
                  //               AppSettings.openAppSettings();
                  //             },
                  //           ),
                  //           TextButton(
                  //             child: Text('Annuler'),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // } else {
                  //   // Le Bluetooth est déjà activé
                  //   // Vous pouvez continuer votre logique de connexion Bluetooth ici
                  // }
                },
                child: Text('Vérifier Bluetooth'),
              ),
            ],
          ),
          const PageProgressIndicator(
            currentPage: 3,
            totalPage: 3,
          ),
        ],
      ),
    );
  }
}
