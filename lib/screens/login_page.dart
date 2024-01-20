import 'package:flutter/material.dart';
import 'package:musicbrainflutter/screens/Experiences/experience_home_page.dart';
import '../models/database_helper.dart';
import 'signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/Bouton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _errorMessage = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 328,
              height: 700,
              margin: const EdgeInsets.only(top: 96, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo.png',
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
                  // Champ d'email
                  Row(
                    children: [
                      if (_errorMessage.isNotEmpty)
                        Text(
                          _errorMessage,
                          style: const TextStyle(
                            color: Color(0xFFF2B8B5),
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFFCAC4D0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  // Champ de mot de passe
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCAC4D0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFFCAC4D0),
                      ),
                    ),
                    obscureText: true,
                    style: const TextStyle(
                      color: Color(0xFFCAC4D0),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 16),
                  // Bouton de connexion
                  Container(
                    width: 156,
                    height: 40,
                    child: GenericButton(
                      buttonText: 'Se connecter',
                      onPressed: () async {
                        String email = emailController.text;
                        String password = passwordController.text;

                        DatabaseHelper databaseHelper = DatabaseHelper();
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
                              builder: (context) => const ExperiencePage(),
                            ),
                          );
                        } else {
                          setState(() {
                            _errorMessage = 'Email ou mot de passe incorrect';
                          });
                        }
                      },
                      buttonTextColor: const Color(0xFF381E72),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Barre grise entre les boutons
                  Container(
                    height: 1,
                    width: 296,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 30),
                  // Bouton d'inscription
                  Container(
                    width: 156,
                    height: 40,
                    child: GenericButtonBV(
                      buttonText: "S'inscrire",
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      borderColor: const Color(0xFFD0BCFF),
                      buttonTextColor: const Color(0xFFD0BCFF),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
