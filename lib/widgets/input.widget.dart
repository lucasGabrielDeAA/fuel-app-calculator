import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var textInputController;

  Input({@required this.textInputController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: textInputController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: "Big Shoulders Display",
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      height: 60,
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
    );
  }
}
