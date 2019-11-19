import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 50),
        Image.asset("assets/images/fuel-white.png", height: 80),
        SizedBox(height: 5),
        Text(
          "Álcool ou Gasolina?",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Big Shoulders Display",
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
