import 'package:flutter/material.dart';

import '../services/database_helper.dart'; // Corrected import statement
import 'profile_page.dart';
import 'login_page.dart';

class DonnesScreen extends StatefulWidget {
  @override
  DonnesScreenState createState() => DonnesScreenState();
}

class DonnesScreenState extends State<DonnesScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.zero,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 45,
                      height: 45,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'BrainMusic',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Participez à des expériences pour obtenir des données',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8), // Add spacing

                    // Updated container structure
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mes données',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '19/06/2024 à 15:43',
                                      style: TextStyle(
                                        color: Color(0xFF49454F),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Session 3',
                                      style: TextStyle(
                                        color: Color(0xFFE6E0E9),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Spacer to create the desired margin
                              SizedBox(width: 15),

                              // Download button with an icon
                              InkWell(
                                onTap: () async {
                                  DatabaseHelper databaseHelper =
                                      DatabaseHelper();
                                  int? id =
                                      await databaseHelper.getSavedUserId();

                                  if (id != null) {
                                    await databaseHelper.insertSession(
                                        "Session1", id);
                                    print("Session1 inserted");
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.download,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Déconnexion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Données',
            backgroundColor: Colors.white,
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
            // You are already on the "Données" tab, no need to navigate to the same screen.
            // If you have specific logic for this tab, you can add it here.
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
}
