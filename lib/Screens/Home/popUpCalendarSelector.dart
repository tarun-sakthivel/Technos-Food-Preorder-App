import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Widgets/Calendars/DynamicCalendar.dart';
import 'package:food_preorder_app/bloc/CalendarBloc/bloc/calendar_bloc.dart';
import 'package:food_preorder_app/dates.dart';

void ShowSelectorCalendar(BuildContext context) {
  showDialog(
    useSafeArea: true,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding:const EdgeInsets.all(0),
        // title: Text(
        //   "Select Date",
        //   style: const TextStyle(color: Colors.white),
        // ),
        
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:MainAxisSize.min,
          children:[ 

             Container(
              decoration:const BoxDecoration(borderRadius:BorderRadius.only(topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10)),                  
                          color:Kivagreen,),
              height:50,
              width:double.infinity,
              
              child: Padding(
                padding: const EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Select Date",style:Ksecondarytext.copyWith(color:Kivawhite,fontWeight: FontWeight.w400,fontSize:20 ),),
                  ],
                ),
              ),
             ),
             Padding(
               padding: const EdgeInsets.all(3.0),
               child: DynamicCalendar(highlightedDates: dummydates,isInteractive: true,),
             ),
          ]
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.read<CalendarBloc>().add(NoChangeInDynamicCalendar());
              Navigator.pop(context);
              
              // setState(context){

              // } // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            child: const Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: () {
              

              
              
              //dates = dates.union(future_dates);
              //modifieddate.clear();
              //calling the Bloc
              context.read<CalendarBloc>().add(ChangeCalendar());
              Navigator.pop(context);
              
              // setState(context){

              // } // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            child: const Text('OK'),
          ),
          


        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Kivawhite,
        elevation: 5.0,
      );
    },
  );

}
