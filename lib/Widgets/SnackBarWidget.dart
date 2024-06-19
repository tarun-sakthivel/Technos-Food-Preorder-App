import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Text.dart';

class SnackbarHelper {
  static void showSnackbar(BuildContext context,
      {required String title,
      required String message,
      required IconData icon,
      required Color color}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(left:10, right: 10,bottom: 30),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 0.9,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.transparent,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Kmaintext,
                    ),
                    Text(
                      message,
                      style: Ksecondarytext
                    ),
                  ],
                ),
              ),
              Icon(
                icon,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }}