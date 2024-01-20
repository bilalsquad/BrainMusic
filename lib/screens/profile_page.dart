import '../services/valideurInput.dart';
import '../widgets/bottombar.dart';
import 'package:flutter/material.dart';
import '../models/database_helper.dart'; // Importer le fichier database_helper.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import '../widgets/Bouton.dart';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16), // ou EdgeInsets.all(0.0)

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(top: 10.0), // Ajoutez cette ligne
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 45,
                        height: 45,
                      ),
                      const SizedBox(height: 8),
                      const Text(
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
                const SizedBox(height: 200),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 41,
                  child: CenteredGenericButtonBV(
                    buttonText: 'Supprimer mes données',
                    onPressed: () async {
                      //DatabaseHelper databaseHelper = DatabaseHelper();
                    },
                    buttonTextColor: const Color(0xFF625B71),
                    borderColor: const Color(0xFF625B71),
                  ),
                ),
                const SizedBox(
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
                        bool Userdelete =
                            await databaseHelper.deleteUserById(id);
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
                    buttonTextColor: const Color(0xFF8C1D18),
                    borderColor: const Color(0xFF8C1D18),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
        ));
  }

  Widget _buildEmailField(String label, String value, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const SizedBox(width: 15),
          Text(
            '$label',
            style: const TextStyle(
                fontSize: 14, color: Colors.white), // Texte en blanc
          ),
        ]),
        Row(
          children: [
            const SizedBox(width: 15),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 14, color: Colors.white), // Texte en blanc
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 54,
              height: 40,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Icon(
                  Icons.edit,
                  color: Color(0xFFD0BCFF) // Couleur du bouton
                  ,
                  size: 25, // Taille de l'icône du bouton
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF2B2930)), // Changer la couleur ici

                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rayon du bouton
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildPasswordField(
      String label, String value, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const SizedBox(width: 15),
          Text(
            '$label',
            style: const TextStyle(
                fontSize: 14, color: Colors.white), // Texte en blanc
          ),
        ]),
        Row(
          children: [
            const SizedBox(width: 15),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 14, color: Colors.white), // Texte en blanc
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 54,
              height: 40,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Icon(
                  Icons.edit,
                  color: Color(0xFFD0BCFF) // Couleur du bouton
                  ,
                  size: 25, // Taille de l'icône du bouton
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF2B2930)), // Changer la couleur ici

                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rayon du bouton
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Future<void> _showPasswordEditDialog(BuildContext context, String label,
      String currentValue, int userId) async {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();

    String mdp = '$label';
    String hintText = 'Nouveau $label';
    String confirmHintText = 'Confirmer $label';

    String ancientPasswordError = '';
    String newPasswordError = '';
    String confirmPasswordError = '';

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Container(
                width: 402.0,
                height: 440.0,
                child: AlertDialog(
                  backgroundColor: const Color(0xFF1d1b20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  title: Text(
                    'Modifier $label',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextFormField(
                          controller: controller,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: mdp,
                            hintStyle: const TextStyle(color: Colors.white54),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFFCAC4D0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15),

                        // Afficher le message d'erreur pour l'ancien mot de passe
                        if (ancientPasswordError.isNotEmpty)
                          Text(
                            ancientPasswordError,
                            style: TextStyle(
                              color: Color(0xFFF2B8B5),
                              fontSize: 12.0,
                            ),
                          ),

                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller2,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: const TextStyle(color: Colors.white54),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFFCAC4D0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15),

                        // Afficher le message d'erreur pour le nouveau mot de passe
                        if (newPasswordError.isNotEmpty)
                          Text(
                            newPasswordError,
                            style: TextStyle(
                              color: Color(0xFFF2B8B5),
                              fontSize: 12.0,
                            ),
                          ),

                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller3,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: confirmHintText,
                            hintStyle: const TextStyle(color: Colors.white54),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFFCAC4D0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 15),

                        // Afficher le message d'erreur pour la confirmation du mot de passe
                        if (confirmPasswordError.isNotEmpty)
                          Text(
                            confirmPasswordError,
                            style: TextStyle(
                              color: Color(0xFFF2B8B5),
                              fontSize: 12.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                          color: Color(0xFFCCC2DC),
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Sauvegarder',
                        style: TextStyle(
                          color: Color(0xFFD0BCFF),
                        ),
                      ),
                      onPressed: () async {
                        String ancientPassword = controller.text;
                        String newPassword = controller2.text;
                        String confirmPassword = controller3.text;

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

                          if (newPassword != confirmPassword) {
                            setState(() {
                              confirmPasswordError =
                                  'Les mots de passe ne correspondent pas';
                              newPasswordError =
                                  ''; // Réinitialisez le message d'erreur pour le nouveau mot de passe
                              ancientPasswordError =
                                  ''; // Réinitialisez le message d'erreur pour l'ancien mot de passe
                            });
                          } else if (userData != null) {
                            String password = userData['password'];

                            if (ancientPassword == password) {
                              setState(() {
                                ancientPasswordError = '';
                                newPasswordError = '';
                                confirmPasswordError = '';
                              });

                              print(
                                  'Ancien mot de passe correct. Nouveau mot de passe: $newPassword');
                              await databaseHelper.updateUser(
                                  userId, userData['email'], newPassword);
                              // Fermez le dialogue
                              Navigator.of(context).pop();
                            } else {
                              setState(() {
                                ancientPasswordError =
                                    'Mot de passe actuel incorrect';
                                newPasswordError =
                                    ''; // Réinitialisez le message d'erreur pour le nouveau mot de passe
                                confirmPasswordError =
                                    ''; // Réinitialisez le message d'erreur pour la confirmation du mot de passe
                              });
                            }
                          } else {
                            print(
                                'Aucun utilisateur trouvé avec l\'ID $userId');
                            return;
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
      },
    );
  }

  Future<void> _showEmailEditDialog(BuildContext context, String label,
      String currentValue, int userId) async {
    TextEditingController passwordController = TextEditingController();
    TextEditingController newEmailController = TextEditingController();

    String mdp = 'Mot de passe';
    String newEmailHint = 'Nouvel $label';

    String passwordError = ''; // Message d'erreur pour le mot de passe
    String emailError = ''; // Message d'erreur pour l'email

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Container(
                width: 402.0,
                height: 440.0,
                child: AlertDialog(
                  backgroundColor: const Color(0xFF1d1b20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  title: Text(
                    'Modifier $label',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: mdp,
                            hintStyle: const TextStyle(color: Colors.white54),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFFCAC4D0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 5),

                        // Afficher le message d'erreur pour le mot de passe
                        if (passwordError.isNotEmpty)
                          Text(
                            passwordError,
                            style: TextStyle(
                              color: Color(0xFFF2B8B5),
                              fontSize: 12.0,
                            ),
                          ),

                        const SizedBox(height: 5),
                        TextFormField(
                          controller: newEmailController,
                          decoration: InputDecoration(
                            hintText: newEmailHint,
                            hintStyle: const TextStyle(color: Colors.white54),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFFCAC4D0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 5),

                        // Afficher le message d'erreur pour l'email
                        if (emailError.isNotEmpty)
                          Text(
                            emailError,
                            style: TextStyle(
                              color: Color(0xFFF2B8B5),
                              fontSize: 12.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                          color: Color(0xFFCCC2DC),
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Sauvegarder',
                        style: TextStyle(
                          color: Color(0xFFD0BCFF),
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
                              setState(() {
                                passwordError = 'Mot de passe incorrect';
                                // Ne réinitialisez pas le message d'erreur pour l'email
                              });
                            } else if (!isValidEmail(newEmail)) {
                              setState(() {
                                emailError =
                                    'Veuillez renseigner une adresse mail correcte';
                                // Ne réinitialisez pas le message d'erreur pour le mot de passe
                              });
                            } else {
                              // Réinitialiser les messages d'erreur
                              setState(() {
                                passwordError = '';
                                emailError = '';
                              });

                              await databaseHelper.updateUser(
                                  userId, newEmail, userData['password']);
                              Navigator.of(context).pop();
                            }
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
      },
    );
  }
}
