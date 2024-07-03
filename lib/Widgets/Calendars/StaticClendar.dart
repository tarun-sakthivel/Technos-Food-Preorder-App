import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/UserModel.dart';
import 'package:food_preorder_app/bloc/CalendarBloc/bloc/calendar_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class StaticCalendar extends StatefulWidget {
  // final Set<DateTime> highlightedDates;
  // final bool isInteractive;

  const StaticCalendar({
    super.key,
    // required this.highlightedDates,
    // this.isInteractive = false,
  });

  @override
  _StaticCalendarState createState() => _StaticCalendarState();
}

class _StaticCalendarState extends State<StaticCalendar> {
  //late Set<DateTime> selectedDates;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    //print(selectedDates.contains(today));
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Check if the current date has crossed the 15th
    if (now.day > 15) {
      // Display next month fully
      lastDayOfMonth = DateTime(now.year, now.month + 2, 0);
    }

    return GestureDetector(
      onTap: (){
        context
            .read<CalendarBloc>()
            .add(ShowDynamicCalendar());
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: TableCalendar(
            firstDay: firstDayOfMonth,
            lastDay: lastDayOfMonth,
            focusedDay: now,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              rightChevronVisible: false,
              leftChevronVisible: false,
              headerPadding: EdgeInsets.only(left: 10, top: 10, bottom: 18),
            ),
            weekNumbersVisible: false,
            headerVisible: true,
            calendarFormat: CalendarFormat.month,
            availableGestures: AvailableGestures.all,
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
            onDaySelected: (selectedDay, focusedDay) {
              context
                                .read<CalendarBloc>()
                                .add(ShowDynamicCalendar());
            },
            daysOfWeekVisible: true,
            daysOfWeekStyle: DaysOfWeekStyle(dowTextFormatter: (date, locale) {
             final daysOfWeek = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
              return daysOfWeek[date.weekday - 1];
            },),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if (isSameDay(today, day) &&
                    future_dates.any((d) => isSameDay(d, day))) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Kivawhite, width: 2),
                      color: const Color.fromRGBO(196, 153, 108, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: Kcalendartext.copyWith(color: Colors.white),
                      ),
                    ),
                  );
                }
                if (future_dates.any((d) => isSameDay(d, day))) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Kivawhite, width: 2),
                          color: Kivagreen,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: Kcalendartext.copyWith(color: Colors.white),
                        ),
                      ));
                } else if (day.isBefore(today)) {
                  return Container(
                      decoration: const BoxDecoration(
                          //border:Border.all(color: Kivawhite,width:2),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: Kcalendartext.copyWith(
                              color: const Color.fromARGB(255, 201, 201, 201)),
                        ),
                      ));
                } else if (day.weekday == DateTime.sunday) {
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
                                255, 201, 201, 201)), // Text style for weekends
                      ),
                    ),
                  );
                }
      
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
                    style: Kcalendartext, // Text style for weekends
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
          ),
        ),
      ),
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
