import 'package:flutter/material.dart';

class Showdevelopers extends StatelessWidget {
  const Showdevelopers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          dev_widget(),
          dev_widget(),
        ]
      ),
    );
  }
}

class dev_widget extends StatelessWidget {
  late String name;
  late String link;
  late String image;
  dev_widget({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(),
        Text("Name"),
        GestureDetector(
          onTap:(){
    
          },
          child: Image.asset("name"),
        )
      ],
    );
  }
}