import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 200,
          ),
          const Text(
            "Bienvenue sur",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0.06,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/Logo.png",
                fit: BoxFit.contain,
                height: 80,
              ),
              const Text(
                'BrainMusic',
                style: TextStyle(
                  color: Color(0xFFE6E0E9),
                  fontSize: 50,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.03,
                ),
              ),
            ],
          ),
          Container(
            width: 372,
            height: 127,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 65),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFD0BCFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          )
        ],
      ),
    ));
  }
}
