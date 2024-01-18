import 'package:flutter/material.dart';
import '../services/database_helper.dart'; // Importer le fichier database_helper.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import '../../models/Bouton.dart';
import 'donnees_page.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;
  final String randomEmail = 'prénom.nom@etu.univ-amu.fr'; // Email au hasard

  final String randomPassword = '********'; // Mot de passe au hasard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.zero, // ou EdgeInsets.all(0.0)

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10.0), // Ajoutez cette ligne
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
                  ],
                ),
              ),
              _buildEmailField('Email', randomEmail, () {
                _showEmailEditDialog(context, 'Email', randomEmail, 1);
              }),
              _buildPasswordField('Mot de passe', randomPassword, () {
                _showPasswordEditDialog(
                  context,
                  'Mot de passe',
                  randomPassword,
                  1,
                );
              }),
              SizedBox(height: 200),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 41,
                child: CenteredGenericButtonBV(
                  buttonText: 'Supprimer mes données',
                  onPressed: () async {
                    //DatabaseHelper databaseHelper = DatabaseHelper();
                  },
                  buttonTextColor: Color(0xFF625B71),
                  borderColor: Color(0xFF625B71),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 41,
                child: CenteredGenericButtonBV(
                  buttonText: 'Supprimer profil',
                  onPressed: () async {
                    DatabaseHelper databaseHelper = DatabaseHelper();
                    Future<int?> getSavedUserId() async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      return prefs.getInt('userId');
                    }

                    int? id = await getSavedUserId();
                    if (id != null) {
                      bool Userdelete = await databaseHelper.deleteUserById(id);
                      if (Userdelete) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      } else {
                        print('Aucun utilisateur trouvé avec cet ID');
                      }
                    }
                  },
                  buttonTextColor: Color(0xFF8C1D18),
                  borderColor: Color(0xFF8C1D18),
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DonnesScreen()),
            );
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

  Widget _buildEmailField(String label, String value, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          SizedBox(width: 15),
          Text(
            '$label',
            style:
                TextStyle(fontSize: 14, color: Colors.white), // Texte en blanc
          ),
        ]),
        Row(
          children: [
            SizedBox(width: 15),
            Text(
              value,
              style: TextStyle(
                  fontSize: 14, color: Colors.white), // Texte en blanc
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 54,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(
                  Icons.edit,
                  color: Color(0xFFD0BCFF) // Couleur du bouton
                  ,
                  size: 18, // Taille de l'icône du bouton
                ),
                label: Text(
                  '',
                  style: TextStyle(fontSize: 14), // Taille du texte du bouton
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF2B2930)), // Changer la couleur ici

                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(22.0), // Rayon du bouton
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildPasswordField(
      String label, String value, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          SizedBox(width: 15),
          Text(
            '$label',
            style:
                TextStyle(fontSize: 14, color: Colors.white), // Texte en blanc
          ),
        ]),
        Row(
          children: [
            SizedBox(width: 15),
            Text(
              value,
              style: TextStyle(
                  fontSize: 14, color: Colors.white), // Texte en blanc
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 54,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(
                  Icons.edit,
                  color: Color(0xFFD0BCFF) // Couleur du bouton
                  ,
                  size: 18, // Taille de l'icône du bouton
                ),
                label: Text(
                  '',
                  style: TextStyle(fontSize: 14), // Taille du texte du bouton
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF2B2930)), // Changer la couleur ici

                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(22.0), // Rayon du bouton
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Future<void> _showPasswordEditDialog(BuildContext context, String label,
      String currentValue, int userId) async {
    TextEditingController controller =
        TextEditingController(); // No initial value
    TextEditingController controller2 =
        TextEditingController(); // No initial value
    TextEditingController controller3 =
        TextEditingController(); // No initial value

    String mdp = '$label';
    String hintText = 'Nouveau $label';
    String confirmHintText = 'Confirmer $label';

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 402.0,
            height: 440.0,
            child: AlertDialog(
              backgroundColor: Color(0xFF1d1b20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0), // Rayon de 100px
              ),
              title: Text(
                'Modifier $label',
                style: TextStyle(
                  color: Colors.white, // Set the text color here
                ),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    // Pour le mot de passe, afficher les champs de confirmation
                    TextFormField(
                      controller: controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: mdp,
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
                    SizedBox(height: 15), // Espace de 15 entre les champs
                    TextFormField(
                      controller: controller2,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 97, 130, 157)),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15), // Espace de 15 entre les champs
                    TextFormField(
                      controller: controller3,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: confirmHintText,
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
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Annuler',
                    style: TextStyle(
                      color: Color(0xFFCCC2DC), // Set the text color here
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    'Sauvegarder',
                    style: TextStyle(
                      color: Color(0xFFD0BCFF), // Set the text color here
                    ),
                  ),
                  onPressed: () async {
                    String Ancient = controller.text;
                    String Nouveau = controller2.text;
                    String CNouveau = controller3.text;

// Mettez à jour la base de données
                    DatabaseHelper databaseHelper = DatabaseHelper();

                    Future<int?> getSavedUserId() async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      return prefs.getInt('userId');
                    }

                    int? userId = await getSavedUserId();

                    if (userId != null) {
                      Map<String, dynamic>? userData =
                          await databaseHelper.getUserById(userId);

                      if (Nouveau != CNouveau) {
                        print('Les mots de passe ne correspondent pas');
                      } else if (userData != null) {
                        // Utilisez les propriétés de l'utilisateur comme nécessaire
                        String password = userData['password'];

                        if (Ancient == password) {
                          print(
                              'Ancien mot de passe correct. Nouveau mot de passe: $Nouveau');
                          await databaseHelper.updateUser(
                              userId, userData['email'], Nouveau);
                          // Fermez le dialogue
                          Navigator.of(context).pop();
                        } else {
                          print('Mot de passe actuel incorrect');
                          return;
                        }
                      } else {
                        print('Aucun utilisateur trouvé avec l\'ID $userId');
                        return;
                      }
                    }
                    // Mettez à jour la base de données
                    // await databaseHelper.updateUser(userId, newValue, label);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> _showEmailEditDialog(
    BuildContext context, String label, String currentValue, int userId) async {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();

  String mdp = 'Mot de passe';
  String newEmailHint = 'Nouvel $label';

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          width: 402.0,
          height: 440.0,
          child: AlertDialog(
            backgroundColor: Color(0xFF1d1b20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0), // Rayon de 100px
            ),
            title: Text(
              'Modifier $label',
              style: TextStyle(
                color: Colors.white, // Set the text color here
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  // Pour le mot de passe, afficher les champs de confirmation
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: mdp,
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
                  SizedBox(height: 15), // Espace de 15 entre les champs
                  TextFormField(
                    controller: newEmailController,
                    decoration: InputDecoration(
                      hintText: newEmailHint,
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 97, 130, 157)),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Annuler',
                  style: TextStyle(
                    color: Color(0xFFCCC2DC), // Set the text color here
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  'Sauvegarder',
                  style: TextStyle(
                    color: Color(0xFFD0BCFF), // Set the text color here
                  ),
                ),
                onPressed: () async {
                  String enteredPassword = passwordController.text;
                  String newEmail = newEmailController.text;

                  // Mettez à jour la base de données
                  DatabaseHelper databaseHelper = DatabaseHelper();

                  Future<int?> getSavedUserId() async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    return prefs.getInt('userId');
                  }

                  int? userId = await getSavedUserId();

                  if (userId != null) {
                    Map<String, dynamic>? userData =
                        await databaseHelper.getUserById(userId);
                    if (userData != null) {
                      if (enteredPassword != userData['password']) {
                        print('Mot de passe incorrect');
                      } else {
                        await databaseHelper.updateUser(
                            userId, newEmail, userData['password']);
                        Navigator.of(context).pop();
                      } // Fermez le dialogue
                    }
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
