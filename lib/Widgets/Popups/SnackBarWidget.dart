import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Text.dart';

class SnackbarHelper {
  static void showSnackbar(BuildContext context,
      {required String message, required IconData icon, required Color color}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: const Color.fromARGB(255, 131, 131, 131).withOpacity(0.2),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
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
                    Text(message, style: Ksecondarytext.copyWith(fontSize: 15)),
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
  }
}
