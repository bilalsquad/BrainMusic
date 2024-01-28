import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/database_helper.dart';
import '../widgets/appbar.dart';
import '../widgets/bottombar.dart';
import '../widgets/dataInfoGraphs.dart';

class DonnesScreenState extends StatefulWidget {
  @override
  _DonnesScreenState createState() => _DonnesScreenState();
}

class _DonnesScreenState extends State<DonnesScreenState> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<int?> getSavedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Données',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8), // Add spacing

                  // Utilisation de FutureBuilder pour récupérer les données de la base de données
                  FutureBuilder<int?>(
                    future: getSavedUserId(),
                    builder: (context, snapshotUserId) {
                      if (snapshotUserId.connectionState ==
                          ConnectionState.waiting) {
                        // En attendant que les données soient chargées, affichez un indicateur de chargement
                        return CircularProgressIndicator();
                      } else if (snapshotUserId.hasError) {
                        // S'il y a une erreur lors du chargement des données, affichez un message d'erreur
                        return Text('Erreur : ${snapshotUserId.error}');
                      } else if (snapshotUserId.data == null) {
                        // Si l'ID utilisateur n'est pas disponible, affichez un message approprié
                        return Text('Aucun utilisateur trouvé.');
                      } else {
                        // Si l'ID utilisateur est disponible, utilisez FutureBuilder pour récupérer les sessions
                        return FutureBuilder<List<Map<String, dynamic>>>(
                          future: databaseHelper
                              .getSessionsForUser(snapshotUserId.data!),
                          builder: (context, snapshotSessions) {
                            if (snapshotSessions.connectionState ==
                                ConnectionState.waiting) {
                              // En attendant que les données soient chargées, affichez un indicateur de chargement
                              return CircularProgressIndicator();
                            } else if (snapshotSessions.hasError) {
                              // S'il y a une erreur lors du chargement des données, affichez un message d'erreur
                              return Text('Erreur : ${snapshotSessions.error}');
                            } else if (!snapshotSessions.hasData ||
                                snapshotSessions.data!.isEmpty) {
                              // S'il n'y a pas de données ou si les données sont vides, affichez un message approprié
                              return Text('Aucune session trouvée.');
                            } else {
                              // Si les données sont disponibles, générez des widgets pour chaque session
                              List<DataInfoWidget> widgets =
                                  snapshotSessions.data!.map((session) {
                                return DataInfoWidget(
                                  sessionText:
                                      'Session ${session['session_numero']}',
                                  dateText: session['date_created'],
                                );
                              }).toList();

                              // Retournez la colonne de widgets générés
                              return Column(children: widgets);
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
