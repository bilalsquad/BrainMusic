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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // App name
            Text(
              'BrainMusic',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80.0), // Space between text and input fields

            // Email input field
            TextFormField(
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
            SizedBox(height: 20.0), // Space between input fields

            // Password input field
            TextFormField(
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
            SizedBox(height: 40.0), // Space between input fields and button

            //
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // background color
                onPrimary: Colors.white, // foreground color
              ),
              onPressed: () {
                // TODO: Implement login logic
              },
              child: Text('Se connecter'),
            ),
            SizedBox(height: 20.0), // Space between buttons

// S'inscrire button
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white), // border color
                foregroundColor: Colors.white, // foreground color
              ),
              onPressed: () {
                // TODO: Implement registration logic
              },
              child: Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
