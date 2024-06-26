import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/bloc/CalendarBloc/bloc/calendar_bloc.dart';
import 'package:food_preorder_app/dates.dart';
import 'package:table_calendar/table_calendar.dart';

class DynamicCalendar extends StatefulWidget {
  final List<DateTime> highlightedDates;
  final bool isInteractive;

  const DynamicCalendar({
    super.key,
    required this.highlightedDates,
    this.isInteractive = false,
  });

  @override
  _DynamicCalendarState createState() => _DynamicCalendarState();
}

class _DynamicCalendarState extends State<DynamicCalendar> {
  //late List<DateTime> selectedDates;
  // List<DateTime> modifieddate = future_dates;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    dummydates.clear();
    dummydates =List.from(dates) ;
    
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    // print("today ${today}");
    //print(selectedDates.contains(today));
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Check if the current date has crossed the 15th
    if (now.day > 15) {
      // Display next month fully
      lastDayOfMonth = DateTime(now.year, now.month + 2, 0);
    }

    return BlocConsumer<CalendarBloc, CalendarState>(
      listener: (context, state) {
        // if (state is AddingToDatabase){
        //   print("from dynamic calendar checking the listerner functionality");
        //   CustomDialog(message: "Adding");
          
        // }
        // if (state is AddingToDatabaseFailed){
        //   showErrorDialog(context, "failed", "error");
        // }
      },
      builder: (context, state) {
        // if (state is AddingToDatabase){
        //   print("from dynamic calendar checking the listerner functionality");
          
        //   return CustomDialog(message: "Adding");
        // }
        
        
        // if (state is DynamicCalendarChanged){
        //   return TableCalendar(
        //   firstDay: firstDayOfMonth,
        //   lastDay: lastDayOfMonth,
        //   focusedDay: now,
        //   headerStyle: const HeaderStyle(
        //       formatButtonVisible: false,
        //       rightChevronVisible: false,
        //       leftChevronVisible: false,
        //       rightChevronPadding: EdgeInsets.only(right: 0, bottom: 10),
        //       leftChevronPadding: EdgeInsets.only(left: 0, bottom: 10),
        //       headerPadding: EdgeInsets.only(left: 10, top: 18, bottom: 10),
        //       decoration: BoxDecoration(color: Kivawhite)),

        //   weekNumbersVisible: false,
        //   headerVisible: true,
        //   calendarFormat: CalendarFormat.month,
        //   availableGestures: widget.isInteractive
        //       ? AvailableGestures.all
        //       : AvailableGestures.none,
        //   calendarStyle: CalendarStyle(

        //       // tableBorder: TableBorder.all(width:1,borderRadius: BorderRadius.circular(14),color:Colors.black),
        //       // rowDecoration: BoxDecoration(border: Border.all(width:1)),
        //       cellMargin: const EdgeInsets.all(2),
        //       isTodayHighlighted: false,
        //       outsideDaysVisible: false,
        //       outsideDecoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(14),
        //           border: Border.all(
        //               width: 2,
        //               color: Colors.black)) // Show outside days for next month
        //       // holidayDecoration: BoxDecoration(
        //       //   color: Colors.green,
        //       //   shape: BoxShape.circle,
        //       // ),
        //       // selectedDecoration: const BoxDecoration(color:Kivagreen,shape:BoxShape.circle),
        //       //todayDecoration: selectedDates.contains(today)? const BoxDecoration(color:Color.fromRGBO(196, 153, 108, 1),shape: BoxShape.circle):const  BoxDecoration(color:Color.fromRGBO(43, 91, 49, 0.4),shape:BoxShape.circle),
        //       //disabledTextStyle: const TextStyle(color: Colors.grey), // Style for disabled dates
        //       ),
        //   daysOfWeekVisible: true,
        //   // selectedDayPredicate: (day) {
        //   //   // Only show selected state for dates that are on or after the current date
        //   //   return selectedDates.any((d) => isSameDay(d, day)) && day.weekday != DateTime.sunday;
        //   // },

        //   onDaySelected: widget.isInteractive
        //       ? (selectedDay, focusedDay) {
        //           // Check if the selected day is not a Saturday or Sunday
                  
        //             context.read<CalendarBloc>().add(AddOrRemoveDate(date: selectedDay));

               
                   
            
        //         }
        //       : null,
        //   calendarBuilders: CalendarBuilders(
        //     defaultBuilder: (context, day, focusedDay) {
        //       // if ( isSameDay(today, day)&& selectedDates.any((d)=>isSameDay(d,day))) {
        //       //   return Container(
        //       //     decoration: BoxDecoration(
        //       //       border:Border.all(color: Kivawhite,width:2),
        //       //       color: Color.fromRGBO(196, 153, 108, 1),
        //       //       shape: BoxShape.circle,
        //       //     ),
        //       //     child: Center(
        //       //       child: Text(
        //       //         '${day.day}',
        //       //         style: const TextStyle(color: Colors.white),
        //       //       ),
        //       //     ),
        //       //   );
        //       // }
        //       if (!isSameDay(today, day) &&
        //           dummydates.any((d) => isSameDay(d, day))  ) {
        //         return Container(
        //             decoration: BoxDecoration(
        //                 border: Border.all(color: Kivawhite, width: 2),
        //                 color: day.isAfter(now)? Kivagreen:null,
        //                 shape: BoxShape.circle),
        //             child: Center(
        //               child: Text(
        //                 '${day.day}',
        //                 style:  Kcalendartext.copyWith(color:day.isAfter(now)? Colors.white:  const Color.fromARGB(
        //                       255, 201, 201, 201)),
        //               ),
        //             ));
        //       } else if (day.weekday == DateTime.sunday || day.isBefore(now)) {
        //         // Disable interaction for Saturdays and Sundays
        //         return Container(
        //           decoration: const BoxDecoration(
        //             color: Colors.transparent,
        //             shape: BoxShape.circle,
        //           ),
        //           child: Center(
        //             child: Text(
        //               '${day.day}',
        //               style: Kcalendartext.copyWith(
        //                   color: const Color.fromARGB(
        //                       255, 201, 201, 201)), // Text style for weekends
        //             ),
        //           ),
        //         );
        //       } else if (day.isBefore(today)) {
        //         return Container(
        //             decoration: const BoxDecoration(
        //                 //border:Border.all(color: Kivawhite,width:2),
        //                 shape: BoxShape.circle),
        //             child: Center(
        //               child: Text(
        //                 '${day.day}',
        //                 style: Kcalendartext.copyWith(
        //                     color: const Color.fromARGB(255, 201, 201, 201)),
        //               ),
        //             ));
        //       }

        //       // if (selectedDates.any((d) => isSameDay(d, day))) {
        //       //   return Container(
        //       //     decoration: const BoxDecoration(
        //       //       color: Colors.green,
        //       //       shape: BoxShape.circle,
        //       //     ),
        //       //     child: Center(
        //       //       child: Text(
        //       //         '${day.day}',
        //       //         style: const TextStyle(color: Colors.white),
        //       //       ),
        //       //     ),
        //       //   );
        //       // }
        //       // If the current date is highlighted, show it in golden color

        //       return Center(
        //         child: Text(
        //           '${day.day}',
        //           style: Kcalendartext, // Text style for weekends
        //         ),
        //       );
        //     },
        //     // todayBuilder: (context, day, focusedDay) {
        //     //   if (selectedDates.contains(now)){
        //     //     return Container(
        //     //       decoration: const BoxDecoration(
        //     //         color: Color.fromRGBO(255, 196, 153, 108),
        //     //         shape: BoxShape.circle,
        //     //       ),
        //     //       child: Center(
        //     //         child: Text(
        //     //           '${day.day}',
        //     //           style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Text style for weekends
        //     //         ),
        //     //       ),
        //     //     );
        //     //   }
        //     //   return null;
        //     // },
        //   ),
        // );
        // }









        return TableCalendar(
          firstDay: firstDayOfMonth,
          lastDay: lastDayOfMonth,
          focusedDay: now,
          
          headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              rightChevronVisible: false,
              leftChevronVisible: false,
              rightChevronPadding: EdgeInsets.only(right: 0, bottom: 10),
              leftChevronPadding: EdgeInsets.only(left: 0, bottom: 10),
              headerPadding: EdgeInsets.only(left: 10, top: 18, bottom: 18),
              decoration: BoxDecoration(color: Kivawhite),
              titleTextStyle :Kcalendattitletext,),
              
              

          weekNumbersVisible: false,
          headerVisible: true,
          calendarFormat: CalendarFormat.month,
          availableGestures: widget.isInteractive
              ? AvailableGestures.all
              : AvailableGestures.none,
          calendarStyle: CalendarStyle(

              // tableBorder: TableBorder.all(width:1,borderRadius: BorderRadius.circular(14),color:Colors.black),
              // rowDecoration: BoxDecoration(border: Border.all(width:1)),
              cellMargin: const EdgeInsets.all(0),
              isTodayHighlighted: false,
              outsideDaysVisible: false,
              outsideDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      width: 2,
                      color: Colors.black)) // Show outside days for next month
              // holidayDecoration: BoxDecoration(
              //   color: Colors.green,
              //   shape: BoxShape.circle,
              // ),
              // selectedDecoration: const BoxDecoration(color:Kivagreen,shape:BoxShape.circle),
              //todayDecoration: selectedDates.contains(today)? const BoxDecoration(color:Color.fromRGBO(196, 153, 108, 1),shape: BoxShape.circle):const  BoxDecoration(color:Color.fromRGBO(43, 91, 49, 0.4),shape:BoxShape.circle),
              //disabledTextStyle: const TextStyle(color: Colors.grey), // Style for disabled dates
              ),
          daysOfWeekVisible: true,
          daysOfWeekStyle: DaysOfWeekStyle(dowTextFormatter: (date, locale) {
           final daysOfWeek = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
            return daysOfWeek[date.weekday - 1];
          },
          weekdayStyle: Ksecondarytext.copyWith(fontSize: 13,color: Kgrey),
          weekendStyle: Ksecondarytext.copyWith(fontSize: 13,color: Kgrey),
          ),
          // selectedDayPredicate: (day) {
          //   // Only show selected state for dates that are on or after the current date
          //   return selectedDates.any((d) => isSameDay(d, day)) && day.weekday != DateTime.sunday;
          // },

          onDaySelected: widget.isInteractive
              ? (selectedDay, focusedDay) {
                  
                    context.read<CalendarBloc>().add(AddOrRemoveDate(date:selectedDay));

                    
                }
              : null,
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              // if ( isSameDay(today, day)&& selectedDates.any((d)=>isSameDay(d,day))) {
              //   return Container(
              //     decoration: BoxDecoration(
              //       border:Border.all(color: Kivawhite,width:2),
              //       color: Color.fromRGBO(196, 153, 108, 1),
              //       shape: BoxShape.circle,
              //     ),
              //     child: Center(
              //       child: Text(
              //         '${day.day}',
              //         style: const TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   );
              // }
              if (!isSameDay(today, day) &&
                  dummydates.any((d) => isSameDay(d, day)) ) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Kivawhite, width: 2),
                        color: day.isAfter(now)? Kivagreen: null,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: Kcalendartext.copyWith(color:day.isAfter(now)? Colors.white:  const Color.fromARGB(
                              255, 201, 201, 201),fontSize: 12),
                      ),
                    ));
              } if (day.weekday == DateTime.sunday || day.isBefore(now)) {
                // Disable interaction for Saturdays and Sundays
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: Kcalendartext.copyWith(
                          color: const Color.fromARGB(
                              255, 201, 201, 201),fontSize: 12), // Text style for weekends
                    ),
                  ),
                );}
              // } if (day.isBefore(today)) {
              //   return Container(
              //       decoration: const BoxDecoration(
              //           //border:Border.all(color: Kivawhite,width:2),
              //           shape: BoxShape.circle),
              //       child: Center(
              //         child: Text(
              //           '${day.day}',
              //           style: Kcalendartext.copyWith(
              //               color: const Color.fromARGB(255, 201, 201, 201)),
              //         ),
              //       ));
              // }

              // if (selectedDates.any((d) => isSameDay(d, day))) {
              //   return Container(
              //     decoration: const BoxDecoration(
              //       color: Colors.green,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Center(
              //       child: Text(
              //         '${day.day}',
              //         style: const TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   );
              // }
              // If the current date is highlighted, show it in golden color

              return Center(
                child: Text(
                  '${day.day}',
                  style: Kcalendartext.copyWith(color: Colors.black,fontSize: 12), // Text style for weekends
                ),
              );
            },
            // todayBuilder: (context, day, focusedDay) {
            //   if (selectedDates.contains(now)){
            //     return Container(
            //       decoration: const BoxDecoration(
            //         color: Color.fromRGBO(255, 196, 153, 108),
            //         shape: BoxShape.circle,
            //       ),
            //       child: Center(
            //         child: Text(
            //           '${day.day}',
            //           style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Text style for weekends
            //         ),
            //       ),
            //     );
            //   }
            //   return null;
            // },
          ),
        );
      },
    );
  }

}
