import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';
import 'package:musicbrainflutter/screens/Experiences/experience5_page.dart';
import 'package:musicbrainflutter/widgets/appbar.dart';
import 'package:musicbrainflutter/widgets/Experience/bottombar_experience.dart';
import '../../widgets/Experience/progression_barre.dart';

class ExperiencePage3 extends StatefulWidget {
  const ExperiencePage3({super.key});

  @override
  State<ExperiencePage3> createState() => _ExperiencePage3State();
}

class _ExperiencePage3State extends State<ExperiencePage3> {
  final String targetDeviceId = "8BB08D8B-2443-7203-24A3-7EB499ACE1CF";
  bool isSearching = false;
  bool deviceFound = false;
  bool isConnected = false;
  String statusMessage = '';
  List<BluetoothDevice> devicesList = [];
  bool maxAttemptsReached = false; // Nouvelle variable d'état

  @override
  void initState() {
    super.initState();
    _listenForBluetoothState();
  }

  void _updateStatus(String message) {
    setState(() {
      statusMessage = message;
    });
  }

  void _listenForBluetoothState() {
    FlutterBlue.instance.state.listen((state) {
      if (state == BluetoothState.off) {
        _showSnackbar('Veuillez activer votre Bluetooth.');
      } else if (state == BluetoothState.on) {
        _searchForDevices();
      }
    });
  }

  void _searchForDevices() {
    setState(() {
      isSearching = true;
      deviceFound = false;
    });

    _scanForDevices();
  }

  void _scanForDevices() {
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 10));

    FlutterBlue.instance.scanResults.listen((results) {
      for (ScanResult result in results) {
        final device = result.device;
        if (device.id.toString() == targetDeviceId) {
          if (!mounted) return;
          setState(() {
            devicesList.add(device);
            deviceFound = true;
            _connectToDevice(device);
          });
          FlutterBlue.instance.stopScan();
          return;
        }
      }
    }).onDone(() {
      if (!mounted) return;
      setState(() {
        if (!deviceFound) {
          // Si l'appareil n'est pas trouvé, recommence la recherche
          _scanForDevices();
        } else {
          isSearching = false;
        }
      });
    });
  }

  void _connectToDevice(BluetoothDevice device) async {
    int attempts = 0;
    maxAttemptsReached = false;

    while (attempts < 3 && !isConnected) {
      try {
        // Tentative de connexion
        await device.connect();
        if (!mounted) return;
        setState(() {
          isConnected = true;
          _updateStatus('Votre appareil est bien connecté');
        });
        break;
      } catch (e) {
        attempts++;
        if (attempts >= 3) {
          if (!mounted) return;
          setState(() {
            maxAttemptsReached = true;
            _updateStatus('Échec de la connexion après 3 tentatives');
          });
        } else {
          if (!mounted) return;
          _updateStatus('Tentative de reconnexion... ($attempts)');
        }
      }
    }
  }

  void _retryConnection() {
    setState(() {
      maxAttemptsReached = false;
      isSearching = true;
      deviceFound = false;
      isConnected = false;
    });
    _searchForDevices();
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void onNextPressed() async {
    final BluetoothState state = await FlutterBlue.instance.state.first;
    if (state != BluetoothState.on) {
      _showSnackbar('Veuillez activer votre Bluetooth.');
    } else if (!isConnected) {
      _showSnackbar('La connexion à l\'appareil n\'est pas établie.');
    } else if (isConnected) {
      print(isConnected);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ExperiencePage5()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotBarExp(
        onPressed: onNextPressed,
      ),
      appBar: const AppBar1(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: isConnected
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 48, key: UniqueKey()),
                          const SizedBox(height: 20),
                          const Text(
                            'Votre appareil est bien connecté',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : isSearching || !deviceFound
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                statusMessage.isEmpty
                                    ? 'Recherche de l\'appareil...'
                                    : statusMessage,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              const CircularProgressIndicator(),
                            ],
                          )
                        : const Text(
                            'Veuillez activer le bluetooth afin de vous connecter au dispositif.',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
              ),
            ),
            if (maxAttemptsReached) ...[
              ElevatedButton(
                onPressed: _retryConnection,
                child: const Text('Voulez-vous retenter la connexion ?'),
              ),
            ],
            const PageProgressIndicator(
              currentPage: 3,
              totalPage: 3,
            ),
          ],
        ),
      ),
    );
  }
}
