import 'package:flutter/material.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/Widgets/selectable_calendar.dart';
import 'package:food_preorder_app/dates.dart';

void ShowSelectorCalendar(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Select Date",
          style: const TextStyle(color: Colors.red),
        ),
        content: Container(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableCalendar(highlightedDates: dates,isInteractive: true,),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {

              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> HomePage()),(route)=>true);
              setState(context){

              } // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('OK'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
      );
    },
  );

}
