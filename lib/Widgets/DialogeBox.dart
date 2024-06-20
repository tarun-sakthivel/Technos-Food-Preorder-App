import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';

class CustomDialog extends StatelessWidget {
  late String message;
  CustomDialog({required this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
      
      decoration: BoxDecoration(color: Kivawhite,borderRadius:BorderRadius.circular(10),border: Border.all(width: 2,color: Colors.black.withOpacity(0.5)) ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Kivagreen,),
            
            Text("${message}"),
          ],
        ),
      ),
    );
  }
}