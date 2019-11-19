import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel/widgets/input.widget.dart';
import 'package:fuel/widgets/loading-button.widget.dart';
import 'package:fuel/widgets/logo.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var gasTextController = new MoneyMaskedTextController();
  var alcTextController = new MoneyMaskedTextController();
  var loading = false;
  var complete = false;
  var result = "";
  Color color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          microseconds: 1200,
        ),
        color: color,
        child: ListView(
          children: <Widget>[
            Logo(),
            Container(
              child: Column(
                children: <Widget>[
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
                    child: LoadingButton(
                      loading: loading,
                      callback: handleCalculate,
                      label: "CALCULAR",
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: complete ? LoadingButton(
                      loading: false,
                      callback: reset,
                      label: "RECALCULAR",
                    ) : null,
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
            Container(
              alignment: Alignment.center,
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Big Shoulders Display",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              height: 60,
              padding: EdgeInsets.only(bottom: 20, left: 30, right: 30, top: 10),
            ),
          ],
        ),
      ),
    );
  }

  Future handleCalculate() {
    double alc = double.parse(
            alcTextController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gas = double.parse(
            gasTextController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double res = alc / gas;

    setState(() {
      loading = true;
      complete = false;
      color = Colors.deepPurpleAccent;
    });

    return new Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() {
                if (res >= 0.7) {
                  result = "O uso de gasolina é recomendado";
                } else {
                  result = "O uso de álcool é recomendado";
                }

                loading = false;
                complete = true;
              })
            });
  }

  reset() {
    setState(() {
      color = Colors.deepPurple;
      alcTextController = new MoneyMaskedTextController();
      gasTextController = new MoneyMaskedTextController();
      loading = false;
      result = "";
      complete = false;
    });
  }
}
