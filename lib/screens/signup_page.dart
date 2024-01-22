import 'package:flutter/material.dart';
import '../models/database_helper.dart';
import '../services/valideurInput.dart';
import '../widgets/Bouton.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xFFF2B8B5)), // Set the error border color
                      ),
                    ),

                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!isValidEmail(value!)) {
                        const TextStyle(color: Color(0xFFF2B8B5));
                        return 'Veuillez renseigner une vraie adresse mail';
                      }
                      return null;
                    },
                    // Add this line to set the error message text color
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF2B8B5)),
                        // Set the error border color
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xFFF2B8B5)), // Set the error border color
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Les mots de passe ne correspondent pas';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 46.0),
                  Container(
                    width: 156,
                    height: 40,
                    child: GenericButton(
                      buttonText: "S'inscrire",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String email = emailController.text;
                          String password = passwordController.text;
                          String confirmPassword =
                              confirmPasswordController.text;
                          print('Email: $email');
                          print('Mot de passe: $password');
                          print('Confirmer mot de passe: $confirmPassword');
                          if (password != confirmPassword) {
                            print('Les mots de passe ne correspondent pas');
                            return;
                          } else {
                            print('Les mots de passe correspondent');
                          }
                          DatabaseHelper databaseHelper = DatabaseHelper();
                          await databaseHelper.insertUser(email, password);
                          Navigator.pop(context);
                        }
                      },
                      buttonTextColor: const Color(0xFF381E72),
                    ),
                  ),
                  const SizedBox(height: 173),
                  GestureDetector(
                    onTap: () {
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
          ],
        ),
      ),
    );
  }
}
