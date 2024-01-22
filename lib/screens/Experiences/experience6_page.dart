import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import '../../widgets/Experience/appbar.dart';
import 'experience7_page.dart';

class ExperiencePage6 extends StatefulWidget {
  const ExperiencePage6({Key? key}) : super(key: key);

  @override
  _ExperiencePage6State createState() => _ExperiencePage6State();
}

class _ExperiencePage6State extends State<ExperiencePage6>
    with WidgetsBindingObserver {
  bool _showText = true;
  bool _showTimer = false;
  int _timerSeconds = 60 * 25 +
      120; // 30 minutes  le +5 sec c'est pour el temps de fermer les yeux
  late AudioPlayer audioPlayer;
  bool _isApplicationPaused = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _initializeAudioPlayer();
    _startTimer();
    WidgetsBinding.instance.addObserver(this);
  }

  void _initializeAudioPlayer() {
    audioPlayer = AudioPlayer();

    audioPlayer.setReleaseMode(
        ReleaseMode.stop); // Release audio player when app goes to background
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

    Future.delayed(const Duration(seconds: 135), () {
      if (mounted) {
        setState(() {
          // Mettre à jour l'état pour lancer la musique
          _playMusic();
        });
      }
    });
  }

  void _playMusic() {
    // Remplacez 'chemin_vers_votre_fichier.mp3' par le chemin réel de votre fichier MP3
    audioPlayer
        .play(AssetSource('assets/BrainMusiqueExp.mp3'))
        .catchError((error) {
      print('Erreur de lecture audio: $error');
    });
  }

  void _startTimer2() {
    const oneSecond = Duration(seconds: 1);

    void updateTimer2() {
      if (mounted) {
        setState(() {
          if (_timerSeconds2 > 0) {
            _timerSeconds2--;
          }
        });
      }
    }

    Timer.periodic(oneSecond, (Timer timer) {
      if (_timerSeconds2 <= 0) {
        timer.cancel();
        if (mounted) {
          setState(() {
            // Mettre à jour l'état pour cacher le minuteur
            _showText2 = false;
          });
        }
        // Naviguer vers la nouvelle page lorsque le minuteur se termine
      } else {
        updateTimer2();
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
            audioPlayer.stop();
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
  void dispose() {
    audioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // L'application est mise en arrière-plan
      _isApplicationPaused = true;
      audioPlayer.pause();
    } else if (state == AppLifecycleState.resumed && _isApplicationPaused) {
      // L'application revient en premier plan après avoir été mise en arrière-plan
      _isApplicationPaused = false;
      audioPlayer.resume();
    }
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
