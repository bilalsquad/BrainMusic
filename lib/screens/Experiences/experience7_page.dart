import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/database_helper.dart';
import '../../widgets/Bouton.dart';
import '../../widgets/appbar.dart';

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
            textAlign: TextAlign.center,
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
            width: 250,
            height: 70,
            child: GenericButton(
              buttonText: 'Terminer l’expérience ',
              onPressed: () async {
                DatabaseHelper databaseHelper = DatabaseHelper();

                Future<int?> getSavedUserId() async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  return prefs.getInt('userId');
                }

                int? id = await getSavedUserId();
                int? num =
                    await databaseHelper.getSessionNumeroWithHighestValue(id!);
                if (num == null) {
                  await DatabaseHelper().insertSessionData(1, id);
                } else {
                  await DatabaseHelper().insertSessionData(num + 1, id);
                }
                await DatabaseHelper().checkAndPrintSessionsTable();
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
