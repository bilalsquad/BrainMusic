import 'package:flutter/material.dart';

class ListePays extends StatefulWidget {
  final Function(bool) onCountrySelectionChanged;
  const ListePays({super.key, required this.onCountrySelectionChanged});

  @override
  State<ListePays> createState() => _ListePaysState();
}

class _ListePaysState extends State<ListePays> {
  // Liste des pays
  List<String> pays = [
    'Pays 1',
    'Pays 2',
    'Pays 3',
    'Pays 4',
    'Pays 5',
    'Pays 6',
    'Pays 7',
    'Pays 8',
    'Pays 9',
    'Pays 10',
    'Pays 10',
    'Pays 11',
    'Pays 12',
    'Pays 13',
    'Pays 14',
    'Pays 15',

    // Ajoutez d'autres pays au besoin
  ];

  // Variable pour stocker le ou les pays sélectionnés
  List<String> selectedPays = [];

  void _showMultiSelectCountries() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scrollbar(
          thumbVisibility: true,
          // Définir à true pour toujours afficher la scrollbar
          thickness: 6.0, // Définir l'épaisseur de la scrollbar
          radius: const Radius.circular(10), // Rayon des coins de la scrollbar
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setStateModal) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: pays.map((String pays) {
                  return CheckboxListTile(
                    title: Text(pays),
                    value: selectedPays.contains(pays),
                    onChanged: (bool? value) {
                      setStateModal(() {
                        if (value == true && !selectedPays.contains(pays)) {
                          selectedPays.add(pays);
                        } else {
                          selectedPays.remove(pays);
                        }
                      });
                      // Appel de setState() du contexte principal pour mettre à jour l'UI globale
                      widget.onCountrySelectionChanged(selectedPays.isNotEmpty);
                    },
                  );
                }).toList(),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sélectionnez les pays auxquels vous appartenez, par votre famille, vos expériences personnelles...',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        ListTile(
          title: const Text('Pays sélectionnés'),
          subtitle: Text(
            selectedPays.isEmpty
                ? 'Aucun pays sélectionné'
                : selectedPays.join(', '),
          ),
          trailing: const Icon(Icons.arrow_drop_down),
          onTap: _showMultiSelectCountries,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        // ... Autres widgets
      ],
    );
  }
}
