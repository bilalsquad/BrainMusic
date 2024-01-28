import 'package:flutter/services.dart';

class MuseInterface {
  final MethodChannel _channel = const MethodChannel('com.example.muse_sdk');

  Future<void> connectToMuse() async {
    try {
      await _channel.invokeMethod('connect_to_muse');
    } catch (e) {
      print('Error connecting to Muse: $e');
    }
  }

  Future<List<double>> getEEGData() async {
    try {
      final List<dynamic> eegData = await _channel.invokeMethod('get_eeg_data');
      if (eegData != null) {
        return eegData.cast<double>();
      }
      return <double>[]; // Retourne une liste vide si les données ne sont pas disponibles
    } catch (e) {
      print('Erreur lors de la récupération des données EEG: $e');
      return <double>[]; // Gestion de l'erreur
    }
  }

  // Ajoutez d'autres méthodes pour d'autres fonctionnalités si nécessaire
}
