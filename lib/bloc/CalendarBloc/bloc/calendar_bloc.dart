import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_preorder_app/API/API_methods.dart';
import 'package:food_preorder_app/UserModel.dart';
import 'package:food_preorder_app/Widgets/Popups/SnackBarWidget.dart';
import 'package:food_preorder_app/utils/SameDayFunction.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    DateTime now = DateTime.now();
    on<ChangeCalendar>((event, emit) async {
      // TODO: implement event handler
      // emit((AddingToDatabase()));
      // await Future.delayed(Duration(seconds: 1));
      //CustomDialog(message: "Adding your orders");

      dates.clear();
      dates = List.from(dummydates);
      getFutureDates(dates);
      emit((CalendarChanged()));
      SnackbarHelper.showSnackbar(event.context,
          message: "Changes Successfull",
          icon: Icons.check,
          color: Colors.green);
    });
    on<AddOrRemoveDate>((event, emit) {
      final date = event.date;
      //&&(date.isAfter(DateTime(now.year, now.month, now.day)) || date.isAtSameMomentAs(now))
      //&& DateTime(date.year, date.month, date.day) !=(DateTime(now.year, now.month, now.day)

      if (date.weekday != DateTime.sunday  &&(date.isAfter(DateTime(now.year, now.month, now.day)) || date.isAtSameMomentAs(now)) 
            ) {
              if (appConstraintSatsifsied(date)){
                //print("more than nine am ${date}");

              }
              else{
                if (dummydates.any((d) => isSameDay(d, date))) {
          //dates.removeWhere((d) => isSameDay(d, selectedDay));
                  dummydates.removeWhere((d) => isSameDay(d, date));
                } else {
                  dummydates.add(date);
                }
                emit((DynamicCalendarChanged()));
              }
        // if (dummydates.any((d) => isSameDay(d, date))) {
        //   //dates.removeWhere((d) => isSameDay(d, selectedDay));
        //   dummydates.removeWhere((d) => isSameDay(d, date));
        // } else {
        //   dummydates.add(date);
        // }
        // print("dates ===========================");
        // print(dates);
        // print("dummydates =================================");
        // print(dummydates);

        
      }
    });

    on<NoChangeInDynamicCalendar>((event, emit) {
      // print("INVOKED CALCEL FUNCTION");
      // print("dates $dates");
      // print("previous dummy data $dummydates");
      dummydates.clear();
      dummydates = List.from(dates);

      // print("dates ${dates}");
      // print("new dummy data ${dummydates}");
      SnackbarHelper.showSnackbar(event.context,
          message: "No changes Done", icon: Icons.close, color: Colors.red);
    });

    on<AddOrdersToDatabase>((event, emit) async {
      //TODO:use the api calls for the post function
      try {
        emit((AddingToDatabase()));
        //print("adding to database state is emmitted");
       
        //TODO: write the api for pushing function in the databse
        await pushPreLunchDetail(Id, dummydates);

        add(ChangeCalendar(context: event.context));
      } catch (e) {
        print(e.toString());

        add(NoChangeInDynamicCalendar(context: event.context));
      }
      Navigator.pop(event.context);
    });

    on<ShowDynamicCalendar>((event, emit) {
      emit((ShowingDynamicCalendar()));
    });
  }
}

bool isAfter9AM() {
  DateTime now = DateTime.now();
  //NOTE this time should be one hour lesser than your expected time
  //if the contraint should be greater than nine then 
  //while typing it should be  8
  //because "now.hour >8 " is true only if it gets  to 9 untill then even if it is 8:15 the return value will be false
  return now.hour > 8;
}

bool appConstraintSatsifsied(DateTime date) {
  DateTime now = DateTime.now();
  if (isSameDay(date, DateTime(now.year,now.month,now.day)) && isAfter9AM()){
      //print("more that 9 am");
      return true;
  }
  //print("less than 9 am");
  return false;
}
