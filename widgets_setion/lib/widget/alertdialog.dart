import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowAlertDialog extends StatelessWidget {
  String title;
  String content;
  ShowAlertDialog({
    @required this.title,
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          showAlertDialog(context);
        },
        child: Text("AlertDialog",
            style: TextStyle(
                fontSize: 30, color: Colors.red, fontWeight: FontWeight.w700)),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500)),
          content: new Text(content,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                new TextButton(
                  child: new Text("Dismiss",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.w500)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: new Text("Show Toast",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500)),
                  onPressed: () {
                    showToast();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Hello From Toast Message !!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        fontSize: 20,
        textColor: Colors.white);
  }
}
