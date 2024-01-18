import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonTextColor;

  GenericButton({
    required this.buttonText,
    required this.onPressed,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFD0BCFF),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0), // Rayon de 100px
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: buttonTextColor),
      ),
    );
  }
}

class GenericButtonBV extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonTextColor;
  final Color borderColor;

  GenericButtonBV({
    required this.buttonText,
    required this.onPressed,
    required this.buttonTextColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color((0xFF2e2e2e)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0), // Rayon de 100px
          side: BorderSide(
            color: borderColor,
            width: 1.0,
          ),
          // Couleur de la bordure
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: buttonTextColor),
      ),
    );
  }
}

class CenteredGenericButtonBV extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonTextColor;
  final Color borderColor;

  CenteredGenericButtonBV({
    required this.buttonText,
    required this.onPressed,
    required this.buttonTextColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GenericButtonBV(
        buttonText: buttonText,
        onPressed: onPressed,
        buttonTextColor: buttonTextColor,
        borderColor: borderColor,
      ),
    );
  }
}
