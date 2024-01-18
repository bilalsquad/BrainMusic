import 'package:flutter/material.dart';
import 'package:musicbrainflutter/screens/Experiences/experience1_page.dart';
import 'experience3_page.dart';

import '../../widgets/Bouton.dart';
import '../../widgets/progression_barre.dart';
import './../../widgets/appbar.dart';

class ExperiencePage2 extends StatefulWidget {
  const ExperiencePage2({Key? key}) : super(key: key);

  @override
  _ExperiencePage2State createState() => _ExperiencePage2State();
}

class _ExperiencePage2State extends State<ExperiencePage2> {
  bool accepteConditions = false;
  Widget build(BuildContext context) {
    // Liste des dates de naissance
    List<String> datesDeNaissance = [
      'Année de naissance',
      ...List.generate(61, (index) => (1960 + index).toString())
    ];

    // Liste des pays
    List<String> pays = [
      'Pays 1',
      'Pays 2',
      'Pays 3',
      // Ajoutez d'autres pays au besoin
    ];

    // Variable pour stocker l'année de naissance sélectionnée
    String selectedYear =
        'Année de naissance'; // Initialisation avec la première année

    // Variable pour stocker le ou les pays sélectionnés
    List<String> selectedPays = [];

    return Scaffold(
      appBar: const AppBar1(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligner à gauche
        children: [
          SizedBox(
            height: 48,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'Informations personnelles !',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 250, // Largeur fixe pour le conteneur
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Couleur de la bordure
                  width: 1.0, // Largeur de la bordure
                ),
                borderRadius: BorderRadius.circular(4.0), // Rayon de bordure
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  border: InputBorder
                      .none, // Supprimer la bordure du décorateur d'entrée
                  contentPadding:
                      EdgeInsets.zero, // Supprimer le rembourrage interne
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedYear,
                  onChanged: (String? newValue) {
                    // Met à jour l'année sélectionnée lorsqu'elle change
                    selectedYear = newValue!;
                  },
                  items: datesDeNaissance.map((String date) {
                    return DropdownMenuItem<String>(
                      value: date,
                      child: Text(date),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'Sélectionnez les pays auxquels vous appartenez, par votre famille, vos expériences personnelles...',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.map),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedPays.isEmpty ? null : selectedPays.first,
                  onChanged: (String? newValue) {
                    setState(() {
                      // Met à jour les pays sélectionnés lorsqu'ils changent
                      if (newValue != null) {
                        selectedPays = [newValue];
                      } else {
                        selectedPays = [];
                      }
                    });
                  },
                  items: [
                    DropdownMenuItem<String>(
                      value: null,
                      child: Text('Culture'),
                    ),
                    ...pays.map((String pays) {
                      return DropdownMenuItem<String>(
                        value: pays,
                        child: Row(
                          children: [
                            Checkbox(
                              value: selectedPays.contains(pays),
                              onChanged: (_) {},
                            ),
                            Text(pays),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            children: [
              Checkbox(
                value: accepteConditions,
                onChanged: (value) {
                  setState(() {
                    accepteConditions = value!;
                  });
                },
              ),
              const Text(
                'J’accepte que mes données soient conservées\n pour être utilisées dans le cadre de l’expérience.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GenericButton(
              buttonText: 'Valider mes Informations ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExperiencePage3(),
                  ),
                );
              },
              buttonTextColor: const Color(0xFF381E72),
            ),
          ),
          SizedBox(
            height: 234,
          ),
          const PageProgressIndicator(
            currentPage: 2,
            totalPage: 3,
          ),
          GenericButtonBV(
            buttonText: 'Retour',
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExperiencePage1(),
                ),
              );
            },
            buttonTextColor: const Color(0xFFD0BCFF),
            borderColor: const Color(0xFF2e2e2e),
          )
        ],
      ),
    );
  }
}
