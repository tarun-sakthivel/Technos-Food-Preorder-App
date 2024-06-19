import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_preorder_app/Constants/Color.dart';

class Button extends StatefulWidget {
  int height;
  int width;
  String text;
  String textStyle;
  Color textColor;
  double fontSize;
  Button(
      {super.key,
      required this.fontSize,
      required this.textColor,
      required this.textStyle,
      required this.height,
      required this.width,
      required this.text});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String text = "Re";
  int height = 0;
  int width = 0;
  String textStyle = '';
  Color textColor = Color(0xFFFFFFFF);
  double fontSize = 16;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.text;
    height = widget.height;
    width = widget.width;
    textColor = widget.textColor;
    textStyle = widget.textStyle;
    fontSize = widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            backgroundColor: Kivagreen),
        child: Text(
          "$text",
          style: TextStyle(
              color: textColor, fontFamily: textStyle, fontSize: fontSize),
        ));
  }
}
