import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:widgets_setion/menu_item/menu_item.dart';
import 'package:widgets_setion/menu_item/menu_model.dart';
import 'package:widgets_setion/widget/alertdialog.dart';
import 'package:widgets_setion/widget/checkbox.dart';
import 'package:widgets_setion/widget/flushbar.dart';
import 'package:widgets_setion/widget/imageslider.dart';
import 'package:widgets_setion/widget/snackbar.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  static String MainID = "MainID";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FToast fToast;
  String seletedItem;
  List languageList = [
    "Java",
    "Kotlin",
    "Dart",
    "Go",
    "Php",
    "C++",
    "Python",
    "JavaScript"
  ];
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff363636),
      appBar: customAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight * 0.9,
          width: constraints.maxWidth * 0.9,
          child: Container(
            child: ExpansionTile(
              title: Text("Flutter Widget",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w700)),
              children: [
                Divider(
                  color: Colors.grey,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      showToast();
                    },
                    child: Text("Toast",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: ShowAlertDialog(
                  title: "Alert!",
                  content:
                      "Welcome In Alert Dialog.\nChoose what you want me to do?",
                )),
                SizedBox(
                  height: 20,
                ),
                Center(child: ShowSnackBar()),
                SizedBox(
                  height: 20,
                ),
                Center(child: ShowFlushBar()),
                SizedBox(
                  height: 20,
                ),
                // move to image slider screen..
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return ImageSlider("Index Of Image");
                      }));
                    },
                    child: Text("ImageSlider",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // move to checkBox and radio button screen..
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return ShowCheckBox();
                      }));
                    },
                    child: Text("CheckBox && Radio",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(child: showDrobDownButton())
              ],
            ),
          ),
        ),
      ),
    );
  }

// show toast message..
  void showToast() {
    Fluttertoast.showToast(
        msg: 'Hello From Toast Message !!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        fontSize: 20,
        textColor: Colors.white);
  }

// show custom appbar..
  Widget customAppBar() {
    return AppBar(
      title: const Text('Widget App'),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ],
        ),
      ),
      actions: [
        PopupMenuButton(
          onSelected: (value) => onSelected(context, value),
          icon: Icon(Icons.menu),
          itemBuilder: (context) =>
              [...MenuModel.menuListItem.map((buildMenuItem)).toList()],
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.pink, Colors.deepPurpleAccent])),
      ),
    );
  }

  // show menu item and set ontap fun..
  PopupMenuItem<MenuItem> buildMenuItem(MenuItem menuItem) =>
      PopupMenuItem<MenuItem>(
        value: menuItem,
        child: Row(
          children: [
            Icon(
              menuItem.menuIcon,
              color: Colors.black,
              size: 24,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              menuItem.menuText,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
  onSelected(BuildContext context, value) {
    switch (value) {
      case MenuModel.settingItem:
        showToast();
        break;
      case MenuModel.infoItem:
        showToast();
        break;
      case MenuModel.settingItem:
        showToast();
        break;
      default:
        showToast();
    }
  }

  // show custom DrobDownButtonr..
  Widget showDrobDownButton() {
    return DropdownButton(
        hint: Text("Your Select",
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.w700)),
        value: seletedItem,
        items: languageList.map((item) {
          return DropdownMenuItem(
            child: Text("Your Selected { $item }",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w700)),
            value: item,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            seletedItem = value;
          });
        });
  }
}
