import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:widgets_setion/main.dart';
import 'package:widgets_setion/widget/alertdialog.dart';

class ShowCheckBox extends StatefulWidget {
  @override
  _ShowCheckBoxState createState() => _ShowCheckBoxState();
}

class _ShowCheckBoxState extends State<ShowCheckBox> {
  int radioValue;
  bool isCheckd = false;
  bool java = false;
  bool kotlin = false;
  bool dart = false;
  bool javaScript = false;
  bool python = false;

  String get text {
    String dialogText = "You Selected : \n";
    if (java == true) dialogText += "Java \n";
    if (kotlin == true) dialogText += "Kotlin \n";
    if (dart == true) dialogText += "Dart \n";
    if (javaScript == true)
      dialogText += "JavaScript \n";
    else
      dialogText += "No Thing\n";
    return dialogText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: radioValue == 0 ? Colors.green : Color(0xff363636),
      appBar: customAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text("Radio Button",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w400)),
          Center(
              child: showRadioListTile(
                  0, "Green", "make screen background full Green")),
          Center(
              child: showRadioListTile(
                  1, "Default", "make screen background full dark")),
          SizedBox(
            height: 20,
          ),
          Text("CheckBox",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w400)),
          CheckboxListTile(
              value: java,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  java = value;
                  if (java) showToast("Java");
                });
              },
              title: Text("Java",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400))),
          CheckboxListTile(
            value: kotlin,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                kotlin = value;
                if (kotlin) showToast("Kotlin");
              });
            },
            title: Text("Kotlin",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
          CheckboxListTile(
              value: dart,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  dart = value;
                  if (dart) showToast("Dart");
                });
              },
              title: Text("Dart",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400))),
          CheckboxListTile(
            value: javaScript,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                javaScript = value;
                if (javaScript) showToast("JavaScript");
              });
            },
            title: Text("JavaScript",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: ShowAlertDialog(
            title: "Thenk You !",
            content: text,
          )),
        ],
      ),
    );
  }

  Widget customAppBar() {
    return AppBar(
      title: const Text("CheckBox..Radio"),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return MyApp();
                      }));
                    },
                    icon: Icon(Icons.arrow_back)))
          ],
        ),
      ),
      actions: [
        Row(children: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ]),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.pink, Colors.deepPurpleAccent])),
      ),
    );
  }

  void showToast(langauge) {
    Fluttertoast.showToast(
        msg: 'You Are Selected The $langauge !!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        fontSize: 20,
        textColor: Colors.white);
  }

  Widget showRadioListTile(value, title, subTitle) {
    return RadioListTile(
      value: value,
      groupValue: radioValue,
      onChanged: (value) {
        setState(() {
          radioValue = value;
        });
      },
      title: Text(title,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400)),
      subtitle: Text(subTitle),
    );
  }
}
