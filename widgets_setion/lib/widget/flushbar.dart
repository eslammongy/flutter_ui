import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ShowFlushBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          showFlushbar(context, FlushbarPosition.BOTTOM);
        },
        child: Text("FlushBar",
            style: TextStyle(
                fontSize: 30, color: Colors.red, fontWeight: FontWeight.w700)),
      ),
    );
  }

  void showFlushbar(context, FlushbarPosition flushbarPosition) {
    Flushbar(
      mainButton: TextButton(
          onPressed: () {
            if (flushbarPosition == FlushbarPosition.BOTTOM) {
              flushbarPosition = FlushbarPosition.TOP;
              showFlushbar(context, flushbarPosition);
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Text("Undo",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600))),
      flushbarPosition: flushbarPosition,
      backgroundGradient: LinearGradient(
        colors: [Colors.blue.shade800, Colors.blueAccent.shade700],
        stops: [0.6, 1],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      borderRadius: 15,
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 8,
        ),
      ],
      titleText: Text(
        "FlushBar!",
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600),
      ),
      messageText: Text(
        "This is A FlushBar ..",
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      icon: Icon(
        Icons.info_sharp,
        color: Colors.black87,
      ),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    ).show(context);
  }
}
