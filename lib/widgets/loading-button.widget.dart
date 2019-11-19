import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var loading = false;
  Function callback;
  var label = "";

  LoadingButton(
      {@required this.loading, @required this.callback, @required this.label});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Theme.of(context).primaryColor,
            ),
            height: 60,
            width: double.infinity,
          )
        : Container(
            child: FlatButton(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Big Shoulders Display",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: callback,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  blurRadius: 2.0,
                  color: Colors.black,
                  offset: new Offset(0.3, 0.3),
                ),
              ],
              color: Theme.of(context).primaryColor,
            ),
            height: 60,
            width: double.infinity,
          );
  }
}
