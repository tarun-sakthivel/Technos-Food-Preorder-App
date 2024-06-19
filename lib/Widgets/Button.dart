import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_preorder_app/Constants/Color.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            backgroundColor: Kivagreen),
        child: Text("Login"));
  }
}
