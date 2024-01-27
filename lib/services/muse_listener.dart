import 'package:flutter_blue/flutter_blue.dart';

class MuseConnectionManager {
  static final MuseConnectionManager _instance =
      MuseConnectionManager._internal();
  BluetoothDevice? museDevice;
  bool isConnected = false;
  bool isSearching = false;
  final String targetDeviceId = "8BB08D8B-2443-7203-24A3-7EB499ACE1CF";

  void Function(bool)? onConnectionChanged;

  factory MuseConnectionManager() {
    return _instance;
  }

  MuseConnectionManager._internal();

  void startScanning() async {
    isConnected = false;
    isSearching = false;
    museDevice = null;
    isSearching = true;
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 10));

    FlutterBlue.instance.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.device.id.toString() == targetDeviceId) {
          FlutterBlue.instance.stopScan();
          museDevice = result.device;
          connectToDevice(museDevice!);
          break;
        }
      }
    });
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      isConnected = true;
      onConnectionChanged?.call(isConnected);
    } catch (e) {
      // Gérer l'erreur de connexion
    }
  }

  void disconnectFromDevice() {
    museDevice?.disconnect();
    isConnected = false;
  }

  Future<void> discoverServices() async {
    if (museDevice != null) {
      List<BluetoothService> services = await museDevice!.discoverServices();
      for (var service in services) {
        print(service);
        print("\n");
        for (var characteristic in service.characteristics) {
          // Ici, vous pouvez traiter chaque caractéristique
          print(characteristic.uuid.toString());
        }
      }
    }
  }

  // Ajoutez ici d'autres méthodes nécessaires pour gérer la connexion, l'écoute des données, etc.
}
