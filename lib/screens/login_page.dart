import 'package:flutter/material.dart';
import 'package:musicbrainflutter/screens/signup_page.dart';
// Importer le package sqflite
import '../models/database_helper.dart'; // Importer le fichier database_helper.dart
import 'profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/Bouton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Ajustement pour commencer en haut
          children: <Widget>[
            Container(
              width: 328,
              height: 505,
              margin: const EdgeInsets.only(
                  top: 96, left: 16), // Ajuster la distance du haut
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo.png', // Assurez-vous de spécifier le chemin correct
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'BrainMusic',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40.0,
                    width: 500,
                  ),
                  Container(
                    width: 156,
                    height: 40,
                    child: GenericButton(
                      buttonText: 'Connexion ',
                      onPressed: () async {
                        String email = emailController.text;
                        String password = passwordController.text;
                        print('Email: $email');
                        print('Mot de passe: $password');

                        DatabaseHelper databaseHelper = DatabaseHelper();
                        // Récupérer l'ID de l'utilisateur
                        int? userId =
                            await databaseHelper.verifyLogin(email, password);
                        Future<void> saveUserId(int userId) async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('userId', userId);
                        }

                        Future<int?> getSavedUserId() async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          return prefs.getInt('userId');
                        }

                        // Sauvegarder l'ID de l'utilisateur localement
                        if (userId != null) {
                          await saveUserId(userId);
                          int? testUserID = await getSavedUserId();
                          print('testUserID: $testUserID');
                          print('Email et mot de passe correct');

                          List<Map<String, dynamic>> users =
                              await databaseHelper.getAllUsers();
                          for (var user in users) {
                            print('User: $user');
                          }

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        } else {
                          print('Email ou mot de passe incorrect');
                        }
                      },
                      buttonTextColor: const Color(0xFF381E72),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text("S'inscrire"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
