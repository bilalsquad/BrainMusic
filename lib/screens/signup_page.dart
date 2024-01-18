import 'package:flutter/material.dart';
import '../services/database_helper.dart'; // Importer le fichier database_helper.dart
import '../../models/Bouton.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 328,
              height: 505,
              margin: EdgeInsets.only(top: 96, left: 16),
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
                      SizedBox(width: 8),
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
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.0),
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
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: 'Confirmer mot de passe',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    width: 156,
                    height: 40,
                    child: GenericButton(
                      buttonText: "S'inscrire",
                      onPressed: () async {
                        String email = emailController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;
                        print('Email: $email');
                        print('Mot de passe: $password');
                        print('Confirmer mot de passe: $confirmPassword');
                        if (password != confirmPassword) {
                          print('Les mots de passe ne correspondent pas');
                          return;
                        } else {
                          print('Les mots de passe correspondent');
                        }
                        // Ajouter l'utilisateur à la base de données
                        // Note: Assurez-vous d'avoir la classe DatabaseHelper définie
                        // et importée correctement ici.
                        DatabaseHelper databaseHelper = DatabaseHelper();
                        await databaseHelper.insertUser(email, password);
                        // Naviguer vers la page du profil après la connexion
                        Navigator.pop(context);
                      },
                      buttonTextColor: Color(0xFF381E72),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Naviguer vers l'écran de connexion
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Déjà un compte ? Connectez-vous',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
}
