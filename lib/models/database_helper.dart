import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<String> getDatabasePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return join(directory.path, 'your_database.db');
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'brainmusic.db');
    return await openDatabase(
      path,
      version: 2, // Increment the version to apply changes
      onCreate: (Database db, int version) async {
        // Create the 'users' table
        await db.execute('''
    CREATE TABLE IF NOT EXISTS users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT,
      password TEXT
    )
  ''');

        // Create the 'sessions' table with a foreign key reference to 'users' table
        await db.execute('''
    CREATE TABLE IF NOT EXISTS sessions(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      session_text TEXT,
      user_id INTEGER,
      date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(user_id) REFERENCES users(id)
    )
  ''');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        // Handle database schema upgrades here if needed
      },
    );
  }

  Future<void> insertSession(String sessionText, int userId) async {
    final Database db = await database;
    await db.insert(
      'sessions',
      {'session_text': sessionText, 'user_id': userId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertUser(String email, String password) async {
    final Database db = await database;
    await db.insert(
      'users',
      {'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateUser(int id, String email, String password) async {
    final Database db = await database;
    await db.update(
      'users',
      {'email': email, 'password': password},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  // Future<void> updateUserMail(int id, String email, String password) async {
  //   final Database db = await database;
  //   await db.update(
  //     'users',
  //     {'email': email, 'password': password},
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }

  Future<int?> verifyLogin(String email, String password) async {
    final Database db = await database;
    var result = await db.query(
      'users',
      columns: ['id'], // Sélectionnez uniquement la colonne 'id'
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    // Si une correspondance est trouvée, retournez l'ID
    if (result.isNotEmpty) {
      return result.first['id'] as int;
    } else {
      // Sinon, retournez null
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final Database db = await database;
    return await db.query('users');
  }

  // Fonction pour supprimer un utilisateur par ID
  Future<bool> deleteUserById(int userId) async {
    final db = await database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );
    return true;
  }

  Future<Map<String, dynamic>?> getUserById(int userId) async {
    final Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query('users', where: 'id = ?', whereArgs: [userId]);

    if (result.isNotEmpty) {
      return result[0];
    } else {
      return null; // Aucun utilisateur trouvé avec cet ID
    }
  }

  Future<void> saveUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', userId);
  }

  // Fonction pour récupérer l'ID de l'utilisateur sauvegardé dans SharedPreferences
  Future<int?> getSavedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }
}
  // Ajoutez d'autres méthodes de base de données en fonction de vos besoins

