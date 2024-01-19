import 'dart:async';
import './../../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'experience7_page.dart'; // Importez la nouvelle page

class ExperiencePage6 extends StatefulWidget {
  const ExperiencePage6({super.key});

  @override
  _ExperiencePage6State createState() => _ExperiencePage6State();
}

class _ExperiencePage6State extends State<ExperiencePage6> {
  bool _showText = true;
  bool _showTimer = false;
  int _timerSeconds = 3; // 30 minutes

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Lancer le minuteur de 30 minutes
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          // Mettre à jour l'état pour cacher le texte
          _showText = false;
          _showTimer = true;
          _startTimer30M();
        });
      }
    });
  }

  void _startTimer30M() {
    const oneSecond = Duration(seconds: 1);

    void updateTimer() {
      if (mounted) {
        setState(() {
          if (_timerSeconds > 0) {
            _timerSeconds--;
          }
        });
      }
    }

    // Lancer le minuteur de 30 minutes
    Timer.periodic(oneSecond, (Timer timer) {
      if (_timerSeconds <= 0) {
        timer.cancel();
        if (mounted) {
          setState(() {
            // Mettre à jour l'état pour cacher le minuteur
            _showTimer = false;
          });
        }
        // Naviguer vers la nouvelle page lorsque le minuteur se termine
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ExperiencePage7()),
        );
      } else {
        updateTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showText)
              const Text(
                'Fermer les yeux',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
              ),
            const SizedBox(height: 20), // Espacement
            if (_showTimer)
              Text(
                '${_timerSeconds ~/ 60}:${(_timerSeconds % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 57,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
