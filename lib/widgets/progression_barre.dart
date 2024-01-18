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
        Text('Etape $currentPage sur $totalPage\n'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: LinearProgressIndicator(
            value: progressValue, // valeur entre 0.0 et 1.0
            backgroundColor: Color(0xFF36343B),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD0BCFF)),
          ),
        ),
      ],
    );
  }
}
