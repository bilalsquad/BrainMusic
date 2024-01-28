import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; // Importer le package sqflite
import 'models/database_helper.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import '../screens/login_page.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getDatabasePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return join(directory.path, 'your_database.db');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String databasePath = await getDatabasePath();
  String path = join(databasePath, 'brainmusic.db');

  // Configure the database factory based on the platform
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    // Platform-specific configurations, if needed
  }

  // Call the initDatabase method without passing a path
  await DatabaseHelper().initDatabase();

  runApp(BrainMusicApp());
}

class BrainMusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrainMusic',
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
