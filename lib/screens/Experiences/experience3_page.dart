import 'package:flutter/material.dart';
import 'package:musicbrainflutter/widgets/appbar.dart';
import 'package:musicbrainflutter/widgets/Experience/bottombar_experience.dart';
import '../../widgets/Experience/progression_barre.dart';
import 'package:musicbrainflutter/screens/Experiences/experience5_page.dart';
import '../../services/muse_listener.dart'; // Importez votre service Muse

class ExperiencePage3 extends StatefulWidget {
  const ExperiencePage3({super.key});

  @override
  State<ExperiencePage3> createState() => _ExperiencePage3State();
}

class _ExperiencePage3State extends State<ExperiencePage3> {
  final MuseConnectionManager museManager = MuseConnectionManager();

  @override
  void initState() {
    super.initState();
    museManager.startScanning();
    museManager.onConnectionChanged = (isConnected) {
      if (mounted) {
        setState(() {});
      }
    };
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void onNextPressed() async {
    if (museManager.isConnected) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ExperiencePage5()));
    } else {
      _showSnackbar('La connexion à l\'appareil n\'est pas établie.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotBarExp(onPressed: onNextPressed),
      appBar: const AppBar1(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: museManager.isConnected
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 48),
                          SizedBox(height: 20),
                          Text(
                            'Votre appareil est bien connecté',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : museManager.isSearching
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                              Text(
                                'Recherche de l\'appareil...',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : const Text(
                            'Veuillez activer le bluetooth afin de vous connecter au dispositif.',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
              ),
            ),
            const PageProgressIndicator(
              currentPage: 3,
              totalPage: 3,
            ),
          ],
        ),
      ),
    );
  }
}
