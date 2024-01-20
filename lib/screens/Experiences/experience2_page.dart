import 'package:flutter/material.dart';
import 'package:musicbrainflutter/widgets/Experience/appbar.dart';
import 'package:musicbrainflutter/widgets/Experience/bottombar_experience.dart';
import 'experience3_page.dart';

import '../../widgets/Experience/progression_barre.dart';

class ExperiencePage2 extends StatefulWidget {
  const ExperiencePage2({Key? key}) : super(key: key);

  @override
  _ExperiencePage2State createState() => _ExperiencePage2State();
}

class _ExperiencePage2State extends State<ExperiencePage2> {
  // Variables de suivi d'état
  bool accepteConditions = false;
  bool selectDate = false;
  bool selectCountry = false;

  // Variable pour stocker le ou les pays sélectionnés
  List<String> selectedPays = [];

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
    String? selectedYear =
        'Année de naissance'; // Initialisation avec la première année

    return Scaffold(
      bottomNavigationBar: BotBarExp(
        pageSuivante: ExperiencePage3(),
        accepteConditions: accepteConditions,
        selectCountry: selectCountry,
        selectDate: selectDate,
      ),
      appBar: const AppBar1(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start, // Aligner à gauche
        children: [
          const SizedBox(
            height: 48,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'Informations personnelles ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  border: InputBorder
                      .none, // Supprimer la bordure du décorateur d'entrée
                  contentPadding:
                      EdgeInsets.zero, // Supprimer le rembourrage interne
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedYear,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedYear = newValue;
                      if (newValue != null) {
                        selectDate = true;
                      } else {
                        selectDate = false;
                      }
                    });
                    // Met à jour l'année sélectionnée lorsqu'elle change
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
          const SizedBox(
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.map),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedPays.isEmpty ? null : selectedPays.first,
                  decoration: InputDecoration(
                    // Utilisez le hint pour afficher les éléments sélectionnés lorsque le menu est fermé.
                    hintText: selectedPays.isEmpty
                        ? 'Culture'
                        : selectedPays.join(', '),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        selectedPays = [newValue];
                      } else {
                        selectedPays = [];
                      }
                    });
                  },
                  items: [
                    const DropdownMenuItem<String>(
                      value: null,
                      child: Text('Culture'),
                    ),
                    ...pays.map((String pays) {
                      return DropdownMenuItem<String>(
                        value: pays,
                        child: StatefulBuilder(
                          // Utilisez un StatefulBuilder pour reconstruire uniquement le menu déroulant.
                          builder: (BuildContext context,
                              StateSetter dropDownState) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: selectedPays.contains(pays),
                                  onChanged: (bool? checked) {
                                    dropDownState(() {
                                      if (checked ?? false) {
                                        selectedPays.add(pays);
                                        selectCountry = true;
                                      } else {
                                        selectedPays.remove(pays);
                                        selectCountry = false;
                                      }
                                    });
                                    // Vous devriez également mettre à jour l'état global du widget ici.
                                    setState(() {});
                                  },
                                ),
                                Text(pays),
                              ],
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
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
          const SizedBox(
            height: 25,
          ),
          const SizedBox(
            height: 100,
          ),
          const PageProgressIndicator(
            currentPage: 2,
            totalPage: 3,
          ),
        ],
      ),
    );
  }
}
