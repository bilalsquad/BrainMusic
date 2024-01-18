import 'package:brain_music/src/screens/Experiences/experience2_page.dart';
import 'package:brain_music/src/widgets/appbar.dart';
import 'package:brain_music/src/widgets/progression_barre.dart';
import 'package:flutter/material.dart';

class ExperiencePage1 extends StatelessWidget {
  const ExperiencePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar1(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '\n\nDurée : 30 minutes\nMatériel : Muse bandeau\nEnvironnement : Calme, seul, les yeux fermés\n',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.50,
            ),
          ),
          Text(
            "L’utilisateur passant l’expérience sera informé du déroulement de celle-ci dans un premier temps. Il confirmera sa participation et son consentement par écrit (signature, mention lu et approuvé, et date).\nEnsuite, lors du début de l’expérience, il s'assoit et met le casque connecté à l’application afin de mesurer son activité cérébrale “au repos” pendant 2 minutes.\nLa lecture des pistes audio débute une fois les 2 minutes passées. Chaque extrait dure environ 1 minute et 30 secondes. Viendra ensuite un temps de transition de quelques secondes, puis une autre piste sera lue et ainsi de suite. Le temps d’écoute total sera de 20 minutes. Pendant toute l’écoute, les données seront acquises par le matériel et le logiciel mesurant l’activité cérébrale.\nA la fin de l’écoute, l’utilisateur est prévenu que l’expérience est terminée par une notification. Il peut alors retirer le casque.\nLes résultats lui seront présentés. Il pourra alors remplir le questionnaire de satisfaction.\n",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.5,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.50,
            ),
          ),
          PageProgressIndicator(
            currentPage: 1,
            totalPage: 3,
          ),
          SizedBox(
            height: 5,
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Experience2()),
              ),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 30), // Réduit le padding vertical
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFD0BCFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Suivant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF381E72),
                    fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 30), // Réduit le padding vertical
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFD0BCFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Suivant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF381E72),
                    fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
