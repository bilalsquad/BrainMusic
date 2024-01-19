import 'package:flutter/material.dart';

class AppBar1 extends StatelessWidget implements PreferredSizeWidget {
  const AppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
            height: 60,
          ),
          const Text(
            'BrainMusic',
            style: TextStyle(
              color: Color(0xFFE6E0E9),
              fontSize: 28,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); // Hauteur standard de la barre d'application
}
