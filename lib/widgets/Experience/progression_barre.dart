import 'package:flutter/material.dart';

class PageProgressIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const PageProgressIndicator({
    Key? key,
    required this.currentPage,
    required this.totalPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcul de la valeur de progression
    final double progressValue = currentPage / totalPage;

    return Column(
      children: [
        Container(
          width: double.infinity, // Largeur maximale
          height: 2, // Hauteur de la bordure
          decoration: BoxDecoration(
            color: Colors.purple[200], // Couleur de la bordure
            borderRadius:
                BorderRadius.circular(1), // Rayon arrondi pour un look lisse
          ),
        ),
        const SizedBox(height: 20), // Espace après la bordure
        Text('Etape $currentPage sur $totalPage\n'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: LinearProgressIndicator(
            value: progressValue, // valeur entre 0.0 et 1.0
            backgroundColor: const Color(0xFF36343B),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD0BCFF)),
          ),
        ),
      ],
    );
  }
}
