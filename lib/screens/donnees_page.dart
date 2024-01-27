import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../widgets/appbar.dart';
import '../widgets/bottombar.dart';
import 'package:flutter/material.dart';

import '../models/database_helper.dart';
import './graphe_page.dart'; // Corrected import statement

class DonnesScreen extends StatefulWidget {
  @override
  DonnesScreenState createState() => DonnesScreenState();
}

class DonnesScreenState extends State<DonnesScreen> {
  //int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Participez à des expériences pour obtenir des données',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),

                    InkWell(
                      onTap: () async {
                        // Lire les données depuis le fichier texte
                        String data =
                            await readDataFromFile('votre_fichier.txt');

                        // Naviguer vers la page des graphes avec les données lues
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GraphPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8), // Add spacing

                    // Updated container structure
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mes données',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '19/06/2024 à 15:43',
                                      style: TextStyle(
                                        color: Color(0xFF49454F),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Session 3',
                                      style: TextStyle(
                                        color: Color(0xFFE6E0E9),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Spacer to create the desired margin
                              const SizedBox(width: 15),

                              // Download button with an icon
                              InkWell(
                                onTap: () async {
                                  DatabaseHelper databaseHelper =
                                      DatabaseHelper();
                                  int? id =
                                      await databaseHelper.getSavedUserId();

                                  if (id != null) {
                                    await databaseHelper.insertSession(
                                        "Session1", id);
                                    print("Session1 inserted");
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.download,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> readDataFromFile(String fileName) async {
  try {
    // Obtenez le répertoire d'application
    Directory directory = await getApplicationDocumentsDirectory();
    // String filePath = '${directory.path}/$fileName';
    String filePath = '../utils/svm_model_test.txt';
    // Lire le contenu du fichier
    File file = File(filePath);
    String data = await file.readAsString();

    return data;
  } catch (e) {
    print('Erreur lors de la lecture du fichier : $e');
    return '';
  }
}
