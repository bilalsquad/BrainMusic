import 'package:flutter/material.dart';
import '../models/database_helper.dart'; // Importer le fichier database_helper.dart
import '../widgets/Bouton.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 92,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 64,
                  height: 64,
                ),
                const SizedBox(width: 8),
                const Text(
                  'BrainMusic',
                  style: TextStyle(
                    color: Color(0xFFE6E0E9),
                    fontSize: 45,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 77),
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
            const SizedBox(height: 16.0),
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
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFFCAC4D0),
                ),
              ),
              obscureText: true,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
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
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFFCAC4D0),
                ),
              ),
              obscureText: true,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 46.0),
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
                buttonTextColor: const Color(0xFF381E72),
              ),
            ),
            const SizedBox(height: 173),
            GestureDetector(
              onTap: () {
                // Naviguer vers l'écran de connexion
                Navigator.pop(context);
              },
              child: const Text(
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
    );
  }
}
