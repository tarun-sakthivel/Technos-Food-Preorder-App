
import 'package:flutter/material.dart';

class Bottomannam extends StatelessWidget {
  const Bottomannam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.white, // Set your desired background color here
     padding: const EdgeInsets.only(bottom: 8),
     child: Image.asset(
       "assets/bottomImage/annamImage.png",
       scale: 3,
     ),
            );
  }
}