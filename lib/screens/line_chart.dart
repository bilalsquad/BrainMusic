import 'dart:async';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample10 extends StatefulWidget {
  LineChartSample10({Key? key}) : super(key: key);

  @override
  State<LineChartSample10> createState() => _LineChartSample10State();
}

class _LineChartSample10State extends State<LineChartSample10> {
  final List<FlSpot> gammaSpots = [];
  final List<FlSpot> betaSpots = [];
  final List<FlSpot> alphaSpots = [];
  final List<FlSpot> thetaSpots = [];
  final List<FlSpot> deltaSpots = [];

  double xValue = 0;
  double step = 0.4;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        gammaSpots.add(FlSpot(xValue, generateRandomValue()));
        betaSpots.add(FlSpot(xValue, generateRandomValue2()));
        alphaSpots.add(FlSpot(xValue, generateRandomValue3()));
        thetaSpots.add(FlSpot(xValue, generateRandomValue4()));
        deltaSpots.add(FlSpot(xValue, generateRandomValue5()));
      });
      xValue += step;
    });
  }

  double generateRandomValue() {
    final random = math.Random();
    return (random.nextDouble() * (100 - 31)) + 31; // Plage de 31 à 100
  }

  double generateRandomValue2() {
    final random = math.Random();
    return (random.nextDouble() * (30 - 16)) + 16; // Plage de 16 à 30
  }

  double generateRandomValue3() {
    final random = math.Random();
    return (random.nextDouble() * (15 - 8)) + 8; // Plage de 8 à 15
  }

  double generateRandomValue4() {
    final random = math.Random();
    return (random.nextDouble() * (7 - 4)) + 4; // Plage de 4 à 7
  }

  double generateRandomValue5() {
    final random = math.Random();
    return (random.nextDouble() * (4 - 0.5)) + 0.5; // Plage de 0.5 à 4
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Liste des couleurs pour chaque courbe
    List<Color> colorsList = [
      Colors.yellow,
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.purple,
    ];

    // Liste des titres pour chaque courbe
    List<String> titlesList = [
      'Gamma (31 - 100 HZ)',
      'Beta (16 - 30 HZ)',
      'Alpha (8 - 15 HZ)',
      'Theta (4 - 7 HZ)',
      'Delta (0.5 - 4 HZ)',
    ];
    // Calcul de la valeur minimale à partir des données

    for (var entry in {
      'Gamma': gammaSpots,
      'Beta': betaSpots,
      'Alpha': alphaSpots,
      'Theta': thetaSpots,
      'Delta': deltaSpots,
    }.values) {
      for (var spot in entry) {}
    }
    // Liste des valeurs minY et maxY pour chaque fréquence
    List<Map<String, double>> axisRanges = [
      {'minY': 31, 'maxY': 100},
      {'minY': 16, 'maxY': 30},
      {'minY': 8, 'maxY': 15},
      {'minY': 4, 'maxY': 7},
      {'minY': 0.5, 'maxY': 4},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (var i = 0; i < colorsList.length; i++)
              Container(
                width: screenWidth - 50,
                height: 450,
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        titlesList[i],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: LineChart(
                          LineChartData(
                            minY: axisRanges[i]['minY']!,
                            maxY: axisRanges[i]['maxY']!,
                            minX: 0,
                            maxX: 25,
                            lineTouchData: LineTouchData(enabled: false),
                            clipData: FlClipData.all(),
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              drawHorizontalLine:
                                  false, // Désactive les lignes horizontales
                            ),
                            borderData: FlBorderData(show: false),
                            axisTitleData: FlAxisTitleData(
                              leftTitle: AxisTitle(
                                titleText: 'Fréquence (Hz)',
                                showTitle: true,
                              ),
                              bottomTitle: AxisTitle(
                                titleText: 'Temps (s)',
                                showTitle: true,
                              ),
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTitles: (value) {
                                  return '$value'; // Ajoutez "Hz" à la fin de la valeur pour l'axe des ordonnées
                                },
                                reservedSize: 50,
                              ),
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTitles: (value) {
                                  return '$value'; // Ajoutez "s" à la fin de la valeur pour l'axe des abscisses
                                },
                                reservedSize: 50,
                              ),
                              rightTitles: SideTitles(showTitles: false),
                              topTitles: SideTitles(showTitles: false),
                            ),
                            lineBarsData: [
                              lineBar(getDataForIndex(i), colorsList[i]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

// Fonction pour obtenir les données pour chaque courbe
  List<FlSpot> getDataForIndex(int index) {
    switch (index) {
      case 0:
        return gammaSpots;
      case 1:
        return betaSpots;
      case 2:
        return alphaSpots;
      case 3:
        return thetaSpots;
      case 4:
        return deltaSpots;
      default:
        return [];
    }
  }

  LineChartBarData lineBar(List<FlSpot> points, Color color) {
    return LineChartBarData(
      spots: points,
      dotData: FlDotData(
        show: false,
      ),
      barWidth: 4,
      isCurved: false,
      colors: [color],
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
