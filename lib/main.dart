import 'package:brain_music/src/screens/Experiences/experience_home_page.dart';
import 'package:flutter/material.dart';
//import 'src/screens/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        title: "BrainMusic",
        home: const ExperiencePage());
  }
}
