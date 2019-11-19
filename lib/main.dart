import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'widgets/input.widget.dart';
import 'widgets/loading-button.widget.dart';
import 'widgets/logo.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combustível',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var gasTextController = new MoneyMaskedTextController();
  var alcTextController = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Container(
            child: Column(
              children: <Widget>[
                // Container(
                //   alignment: Alignment.center,
                //   child: Text(
                //     "Teste",
                //     style: TextStyle(
                //       color: Theme.of(context).primaryColor,
                //       fontFamily: "Big Shoulders Display",
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(25),
                //     color: Colors.white,
                //   ),
                //   height: 90,
                // ),
                Container(
                  child: Text(
                    "Gasolina",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "Big Shoulders Display",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                ),
                Input(textInputController: gasTextController),
                Container(
                  child: Text(
                    "Álcool",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "Big Shoulders Display",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                ),
                Input(textInputController: alcTextController),
                SizedBox(height: 20),
                Container(
                  child: LoadingButton(loading: true, callback: (){}, label: "CALCULAR"),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.8),
            ),
            margin: EdgeInsets.only(left: 30, right: 30, top: 30),
            padding: EdgeInsets.only(bottom: 20, left: 30, right: 30, top: 10),
          ),
        ],
      ),
    );
  }
}
