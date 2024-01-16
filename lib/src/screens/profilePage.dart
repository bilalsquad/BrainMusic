import 'package:flutter/material.dart';
import './LoginPage.dart';

class ProfileScreen extends StatelessWidget {
  final String randomEmail = 'exemple@email.com'; // Email au hasard
  final String randomPassword = '********'; // Mot de passe au hasard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataField('Email', randomEmail),
            SizedBox(height: 10),
            _buildDataField('Mot de passe', randomPassword),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Déconnexion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Données',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Expérience',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else if (index == 1) {
            print('Donnée:');
          } else if (index == 2) {
            print('Experience:');
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildDataField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              '$label:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Action lorsque l'utilisateur appuie sur le bouton crayon
                print('$label: $value');
              },
              icon: Icon(Icons.edit),
              label: Text('Modifier'),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
