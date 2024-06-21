import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';

class Button extends StatefulWidget {
  Size size;
  
  String textStyle;
  Color textColor;
  double fontSize;
  Widget customWidget;
  Function() Navigation;

  Button(
      {super.key,
      required this.Navigation,
      required this.fontSize,
      required this.textColor,
      required this.textStyle,
      required this.size,
      
      required this.customWidget});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String text = "Re";
  Size size = const Size(70, 40);
  String textStyle = '';
  Color textColor = const Color(0xFFFFFFFF);
  double fontSize = 16;
  late Function() Navigation;
  Widget customWidget = const Text("Click!");
  @override
  void initState() {
   
    super.initState();
    customWidget = widget.customWidget;
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
        // child: Text(
        //   text,
        //   style: TextStyle(
        //       color: textColor, fontFamily: textStyle, fontSize: fontSize),
        // ));
        child:customWidget);
  }
}
