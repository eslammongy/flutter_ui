import 'package:flutter/material.dart';

class ShowSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          showSnackbar(context);
        },
        child: Text("SnackBar",
            style: TextStyle(
                fontSize: 30, color: Colors.red, fontWeight: FontWeight.w700)),
      ),
    );
  }

  void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Welcome From SnackBar !!"),
      backgroundColor: Colors.black54,
      action: SnackBarAction(label: ("Undo"), onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
