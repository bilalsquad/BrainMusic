import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

import 'package:csv/csv.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<double> numericData = generateRandomData(10);
    List<int> timeValues = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10
    ]; // Valeurs de temps en secondes
    List<int> Frequences = [70, 72, 75, 78, 80, 82, 85, 88, 90, 92];

    List<FlSpot> lineChartSpots = [];
    for (int i = 0; i < numericData.length; i++) {
      lineChartSpots.add(FlSpot(timeValues[i].toDouble(), numericData[i]));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onde Gamma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Container(
                child: LineChart(
                  LineChartData(
                    axisTitleData: FlAxisTitleData(
                      leftTitle: AxisTitle(
                          titleText: 'Fréquence (Hz)', showTitle: true),
                      bottomTitle:
                          AxisTitle(titleText: 'Temps (s)', showTitle: true),
                    ),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) => value.toStringAsFixed(0),
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) => value.toString(),
                        reservedSize: 30,
                        margin: 10,
                      ),
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                      // Modifier ces titres selon vos besoins
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border:
                          Border.all(color: const Color(0xff37434d), width: 1),
                    ),
                    minX: 0,
                    maxX: timeValues.length.toDouble(),
                    minY: numericData.reduce((a, b) => a < b ? a : b),
                    maxY: numericData.reduce((a, b) => a > b ? a : b),
                    lineBarsData: [
                      LineChartBarData(
                        spots: lineChartSpots,
                        isCurved: true,
                        colors: [Colors.blue],
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                  swapAnimationDuration:
                      const Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Charger les données du fichier
                loadFileData().then((fileData) {
                  // Afficher les données dans un print
                  print(fileData);

                  // Vérifier si le fichier a été lu avec succès
                  if (fileData.isNotEmpty) {
                    // Afficher un SnackBar pour indiquer que le fichier a été lu avec succès
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Fichier lu avec succès !'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    // Afficher un SnackBar en cas d'erreur de lecture du fichier
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erreur lors de la lecture du fichier.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                });
              },
              child: Text('Afficher les données du fichier'),
            ),
          ],
        ),
      ),
    );
  }

  List<double> generateRandomData(int count) {
    Random random = Random();
    List<double> data = [];

    for (int i = 0; i < count; i++) {
      data.add(random.nextDouble() * 100); // Génère des valeurs entre 0 et 100
    }

    return data;
  }
}

Future<List<List<dynamic>>> loadFileData() async {
  try {
    // Obtenir le répertoire des documents de l'application
    //final directory = await getApplicationDocumentsDirectory();
    final path = "./assets/svm_model.txt";

    // Charger le contenu du fichier CSV
    String csvString = await rootBundle.loadString(path);
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);

    return csvTable;
  } catch (e) {
    print('Erreur lors de la lecture du fichier CSV : $e');
    return []; // Gérer l'erreur comme nécessaire
  }
}
