import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:musicbrainflutter/services/muse_listener.dart';

import '../../widgets/appbar.dart';
import 'experience7_page.dart';

class ExperiencePage6 extends StatefulWidget {
  const ExperiencePage6({Key? key}) : super(key: key);

  @override
  _ExperiencePage6State createState() => _ExperiencePage6State();
}

class _ExperiencePage6State extends State<ExperiencePage6>
    with WidgetsBindingObserver {
  bool _showText = true;
  bool _showText2 = false;
  bool _showTimer = false;
  int _timerSeconds = 60 * 25 +
      120; // 30 minutes  le +5 sec c'est pour el temps de fermer les yeux
  int _timerSeconds2 = 10;

  late AudioPlayer audioPlayer;
  bool _isApplicationPaused = false;

  final MuseConnectionManager museManager = MuseConnectionManager();

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _initializeAudioPlayer();
    _startTimer();
    WidgetsBinding.instance?.addObserver(this);
    museManager.discoverServices();
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
          _showText2 =
              true; // Set _showText2 to true before starting the 10-second timer
        });
      }
      _startTimer2();
    });

    Future.delayed(const Duration(seconds: 16), () {
      if (mounted) {
        setState(() {
          // Mettre à jour l'état pour cacher le texte
          _showText = false;

          _showTimer = true;
          _startTimer30M();
        });
        // Start the 10-second timer after updating the state
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
    audioPlayer.play(AssetSource('BrainMusiqueExp.mp3')).catchError((error) {
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
    WidgetsBinding.instance?.removeObserver(this);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centrer horizontalement les enfants
            children: [
              if (_showText)
                const Text(
                  'Fermer les yeux',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center, // Alignement du texte
                ),
              if (_showText2)
                Text(
                  "L'expérience commence dans,\n" +
                      '${_timerSeconds2 ~/ 60}:${(_timerSeconds2 % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center, // Alignement du texte
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
                  textAlign: TextAlign.center, // Alignement du texte
                ),
            ],
          ),
        ),
      ),
    );
  }
}
