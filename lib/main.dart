import 'package:flutter/material.dart';

void main() {
  runApp(BrainMusicApp());
}

class BrainMusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrainMusic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

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
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          width: 328,
          height: 315,
          margin: EdgeInsets.only(top: 299, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'BrainMusic',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
              SizedBox(height: 40.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;
                  print('Email: $email');
                  print('Mot de passe: $password');

                  // TODO: Implémenter la logique de connexion

                  // Naviguer vers la page du profil après la connexion
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ProfileScreen()),
                  //   );
                  //
                },
                child: Text('Se connecter'),
              ),
              SizedBox(height: 20.0),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Naviguer vers l'écran d'inscription
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text("S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        child: Container(
          width: 328,
          height: 375, // Ajuster la hauteur en fonction des éléments ajoutés
          margin: EdgeInsets.only(top: 299, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'BrainMusic',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;
                  print('Email: $email');
                  print('Mot de passe: $password');
                  print('Confirmer mot de passe: $confirmPassword');
                  // TODO: Implémenter la logique d'inscription
                },
                child: Text("S'inscrire"),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  // Naviguer vers l'écran de connexion
                  Navigator.pop(context);
                },
                child: Text(
                  'Déjà un compte ? Connectez-vous',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
