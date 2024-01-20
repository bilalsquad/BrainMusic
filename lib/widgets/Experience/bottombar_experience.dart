import 'package:flutter/material.dart';

class BotBarExp extends StatelessWidget {
  final Widget pageSuivante;
  bool? accepteConditions;
  bool? selectDate;
  bool? selectCountry;

  BotBarExp(
      {Key? key,
      required this.pageSuivante,
      this.selectDate,
      this.selectCountry,
      this.accepteConditions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Retour',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD0BCFF),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.10,
                ),
              )),
          ElevatedButton(
              onPressed: () => {
                    if (accepteConditions != null)
                      {
                        if (accepteConditions == true &&
                            selectDate == true &&
                            selectCountry == true)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => pageSuivante))
                          }
                        else
                          {
                            // Afficher un SnackBar ou un dialogue
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Veuillez sélectionner au moins un pays, une année et accepter les conditions.'),
                              ),
                            )
                          },
                        print(accepteConditions),
                        print(selectDate),
                        print(selectCountry)
                      }
                    else
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pageSuivante))
                      }
                  },
              child: const Text(
                'Suivant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD0BCFF),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.10,
                ),
              )),
        ],
      ),
    );
  }
}
