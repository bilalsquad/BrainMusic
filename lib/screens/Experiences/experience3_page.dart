import 'package:musicbrainflutter/screens/Experiences/experience4_page.dart';
import 'package:musicbrainflutter/widgets/Experience/appbar.dart';
import 'package:musicbrainflutter/widgets/Experience/bottombar_experience.dart';
import '../../widgets/Experience/progression_barre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ExperiencePage3 extends StatefulWidget {
  const ExperiencePage3({super.key});

  @override
  State<ExperiencePage3> createState() => _ExperiencePage3State();
}

class _ExperiencePage3State extends State<ExperiencePage3> {
  void onNextPressed() async {
    final BluetoothState state = await FlutterBlue.instance.state.first;

    if (state == BluetoothState.on) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ExperiencePage4()));
    } else {
      print(state);
      // Afficher un SnackBar ou un dialogue
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez activer votre bluetooth'),
        ),
      );
    }
  }

  bool isSearching = false;
  List<BluetoothDevice> devicesList = [];

  @override
  void initState() {
    super.initState();
    _listenForBluetoothState();
  }

  void _listenForBluetoothState() {
    FlutterBlue.instance.state.listen((state) {
      if (state == BluetoothState.off) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Veuillez activer votre Bluetooth.'),
          ),
        );
      } else if (state == BluetoothState.on) {
        _searchForDevices();
      }
    });
  }

  void _searchForDevices() {
    setState(() {
      isSearching = true;
    });

    FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));

    FlutterBlue.instance.scanResults.listen((results) {
      for (ScanResult result in results) {
        final device = result.device;
        if (!devicesList.any((d) => d.id == device.id)) {
          setState(() {
            devicesList.add(device);
          });
        }
      }
    });

    FlutterBlue.instance.stopScan().then((_) {
      setState(() {
        isSearching = false;
      });
    });
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
            const SizedBox(
              height: 70,
            ),
            if (isSearching == false)
              Container(
                height: 300,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: const Text(
                        'Veuillez activer le bluetooth afin de vous connecter au dispositif.',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (isSearching) const CircularProgressIndicator(),
                    Expanded(
                      child: isSearching
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: devicesList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(devicesList[index].name),
                                  subtitle:
                                      Text(devicesList[index].id.toString()),
                                  onTap: () {
                                    // Connectez-vous à l'appareil ou passez à l'écran suivant
                                  },
                                );
                              },
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
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
