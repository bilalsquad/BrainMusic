import 'package:flutter/material.dart';
import 'package:musicbrainflutter/widgets/Experience/bottombar_experience.dart';
import './../../widgets/appbar.dart';
import '../../widgets/Experience/progression_barre.dart';
import './experience2_page.dart';

class ExperiencePage1 extends StatelessWidget {
  const ExperiencePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBar1(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
            ],
          ),
        ),
        bottomNavigationBar: BotBarExp(
          pageSuivante: ExperiencePage2(),
        ));
  }
}
