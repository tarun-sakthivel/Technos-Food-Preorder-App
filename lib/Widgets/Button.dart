import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Screens/Login/Home/HomePage.dart';

class Button extends StatefulWidget {
  Size size;
  String text;
  String textStyle;
  Color textColor;
  double fontSize;
  Function() Navigation;

  Button(
      {super.key,
      required this.Navigation,
      required this.fontSize,
      required this.textColor,
      required this.textStyle,
      required this.size,
      required this.text});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String text = "Re";
  Size size = Size(70, 40);
  String textStyle = '';
  Color textColor = const Color(0xFFFFFFFF);
  double fontSize = 16;
  late Function() Navigation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.text;
    size = widget.size;
    textColor = widget.textColor;
    textStyle = widget.textStyle;
    fontSize = widget.fontSize;
    Navigation = widget.Navigation;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:
            Navigation, //This is the place for navigating when pressed this button
        style: ElevatedButton.styleFrom(
            maximumSize: size,
            minimumSize: size,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            backgroundColor: Kivagreen),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontFamily: textStyle, fontSize: fontSize),
        ));
  }
}
