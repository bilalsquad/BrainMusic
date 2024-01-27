import 'package:flutter/material.dart';
import 'package:musicbrainflutter/widgets/appbar.dart';
import 'package:musicbrainflutter/widgets/Experience/bottombar_experience.dart';
import 'package:musicbrainflutter/widgets/Experience/selected_country.dart';
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

  void _onNextPressed() async {
    if (accepteConditions == true &&
        selectDate == true &&
        selectCountry == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ExperiencePage3()));
    } else {
      // Afficher un SnackBar ou un dialogue
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Veuillez sélectionner au moins un pays, une année et accepter les conditions.'),
        ),
      );
      print(accepteConditions);
      print(selectDate);
      print(selectCountry);
    }
  }

  // Liste des dates de naissance
  List<String> datesDeNaissance = [
    ...List.generate(61, (index) => (1960 + index).toString())
  ];

  // Variable pour stocker l'année de naissance sélectionnée
  String? selectedYear; // Initialisation avec la première année

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotBarExp(
        onPressed: _onNextPressed,
      ),
      appBar: const AppBar1(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start, // Aligner à gauche
          children: [
            const SizedBox(
              height: 48,
            ),
            Container(
              width: double.infinity,
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
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    value: selectedYear, // L'année sélectionnée actuellement
                    hint: const Text(
                        "Année de naissance"), // Le texte qui s'affiche lorsque rien n'est encore sélectionné
                    onChanged: (String? newValue) {
                      // Met à jour l'état lorsque l'utilisateur sélectionne une autre année
                      setState(() {
                        selectedYear = newValue;
                        selectDate = newValue !=
                            null; // Mettre à jour la variable d'état `selectDate` en fonction de si une année a été sélectionnée
                      });
                    },
                    items: datesDeNaissance
                        .map<DropdownMenuItem<String>>((String date) {
                      // Crée un menu d'éléments pour chaque date de naissance
                      return DropdownMenuItem<String>(
                        value: date,
                        child: Text(date),
                      );
                    }).toList(), // Convertit la carte en une liste pour les éléments du menu déroulant
                    isExpanded:
                        true, // Fait en sorte que le bouton déroulant occupe toute la largeur disponible
                  ))),
            ),
            const SizedBox(
              height: 16,
            ),
            ListePays(
              onCountrySelectionChanged: (bool isSelected) {
                // Mettez à jour l'état du widget parent ici
                setState(() {
                  selectCountry = isSelected;
                });
              },
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
                Expanded(
                  // Utilisation d'Expanded pour permettre au texte de s'étendre
                  child: const Text(
                    'J’accepte que mes données soient conservées\npour être utilisées dans le cadre de l’expérience.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
      ),
    );
  }
}
