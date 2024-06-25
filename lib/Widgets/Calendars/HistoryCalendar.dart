import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/dates.dart';
import 'package:table_calendar/table_calendar.dart';

class HistorryCalendar extends StatefulWidget {
  final Set<DateTime> highlightedDates;
  final bool isInteractive;
  const HistorryCalendar({
    super.key,
    required this.highlightedDates,
    this.isInteractive = false,
  });

  @override
  State<HistorryCalendar> createState() => _HistorryCalendarState();
}

class _HistorryCalendarState extends State<HistorryCalendar> {
  @override
  Widget build(BuildContext context) {
    getFutureDates(dates);

    DateTime now = DateTime(2024, 6, 24);
    DateTime today = DateTime(now.year, now.month, now.day);
    print("today $today");
    //print(selectedDates.contains(today));
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Check if the current date has crossed the 15th

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Kivagreen,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14))),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20, bottom: 15),
            child: Text(
              'History',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Poppins'),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14))),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TableCalendar(
              firstDay: firstDayOfMonth,
              lastDay: lastDayOfMonth,
              focusedDay: now,
              headerStyle: const HeaderStyle(
                headerPadding: EdgeInsets.all(16),
                titleTextStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                leftChevronVisible: false,
                formatButtonVisible: false,
                rightChevronVisible: false,
              ),

              weekNumbersVisible: false,
              headerVisible: true,
              calendarFormat: CalendarFormat.month,
              availableGestures: AvailableGestures.none,
              calendarStyle: CalendarStyle(
                  holidayTextStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                  defaultTextStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                  // tableBorder: TableBorder.all(width:1,borderRadius: BorderRadius.circular(14),color:Colors.black),
                  // rowDecoration: BoxDecoration(border: Border.all(width:1)),
                  cellMargin: const EdgeInsets.all(0),
                  isTodayHighlighted: false,
                  outsideDaysVisible: false,
                  outsideDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          width: 2,
                          color:
                              Colors.black)) // Show outside days for next month
                  // holidayDecoration: BoxDecoration(
                  //   color: Colors.green,
                  //   shape: BoxShape.circle,
                  // ),
                  // selectedDecoration: const BoxDecoration(color:Kivagreen,shape:BoxShape.circle),
                  //todayDecoration: selectedDates.contains(today)? const BoxDecoration(color:Color.fromRGBO(196, 153, 108, 1),shape: BoxShape.circle):const  BoxDecoration(color:Color.fromRGBO(43, 91, 49, 0.4),shape:BoxShape.circle),
                  //disabledTextStyle: const TextStyle(color: Colors.grey), // Style for disabled dates
                  ),
              daysOfWeekStyle:
                  DaysOfWeekStyle(dowTextFormatter: (date, locale) {
                final daysOfWeek = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                return daysOfWeek[date.weekday - 1];
              }),

              // selectedDayPredicate: (day) {
              //   // Only show selected state for dates that are on or after the current date
              //   return selectedDates.any((d) => isSameDay(d, day)) && day.weekday != DateTime.sunday;
              // },

              // onDaySelected: widget.isInteractive
              //     ? (selectedDay, focusedDay) {
              //         // Check if the selected day is not a Saturday or Sunday
              //         if (selectedDay.weekday != DateTime.sunday && selectedDay.isAfter(DateTime(now.year, now.month, now.day)) ) {

              //             setState(() {
              //               if (selectedDates.any((d) => isSameDay(d, selectedDay))) {
              //                 selectedDates.removeWhere((d) => isSameDay(d, selectedDay));
              //               } else {
              //                 selectedDates.add(selectedDay);
              //               }
              //             });
              //             print(selectedDates);

              //         }
              //       }
              //     : null,
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
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
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
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
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
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 201, 201,
                                  201)), // Text style for weekends
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(
                                  255, 0, 0, 0)), // Text style for weekends
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

                  return null;
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
      ],
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
