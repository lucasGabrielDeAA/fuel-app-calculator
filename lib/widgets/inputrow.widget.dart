import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class InputRow extends StatelessWidget {
  final String label;
  final MoneyMaskedTextController textInputController;

  InputRow({@required this.label, @required this.textInputController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Big Shoulders Display",
              fontSize: 30,
            ),
          ),
          width: 100,
        ),
        SizedBox(
          width: 20
        ),
        Expanded(
          child: TextFormField(
            controller: textInputController,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Big Shoulders Display",
              fontSize: 30,
            ),
          ),
        )
      ],
    );
  }
}
