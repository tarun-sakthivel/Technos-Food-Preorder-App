import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/dates.dart';
import 'package:table_calendar/table_calendar.dart';

class StaticCalendar extends StatefulWidget {
  final List<DateTime> highlightedDates;
  final bool isInteractive;

  const StaticCalendar({super.key, 
    required this.highlightedDates,
    this.isInteractive = false,
  });

  @override
  _StaticCalendarState createState() => _StaticCalendarState();
}

class _StaticCalendarState extends State<StaticCalendar> {
  late List<DateTime> selectedDates;

  @override
  void initState() {
    super.initState();
    getFutureDates(widget.highlightedDates);
    // selectedDates = List.from(widget.highlightedDates);
    selectedDates = future_dates;
    
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year,now.month,now.day);
    print("today ${today}");
    print(selectedDates.contains(today));
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Check if the current date has crossed the 15th
    if (now.day > 15) {
      // Display next month fully
      lastDayOfMonth = DateTime(now.year, now.month + 2, 0);
    }

    return TableCalendar(
      firstDay: firstDayOfMonth,
      lastDay: lastDayOfMonth,
      focusedDay: now,
      headerVisible: true,
      calendarFormat: CalendarFormat.month,
      availableGestures: widget.isInteractive ? AvailableGestures.all : AvailableGestures.none,
      calendarStyle:  CalendarStyle(
        outsideDaysVisible: false, // Show outside days for next month
        // holidayDecoration: BoxDecoration(
        //   color: Colors.green,
        //   shape: BoxShape.circle,
        // ),
        selectedDecoration: const BoxDecoration(color:Kivagreen,shape:BoxShape.circle),
        todayDecoration: selectedDates.contains(today)? const BoxDecoration(color:Color.fromRGBO(196, 153, 108, 1),shape: BoxShape.circle):const  BoxDecoration(color:Color.fromRGBO(43, 91, 49, 0.4),shape:BoxShape.circle),
        //disabledTextStyle: const TextStyle(color: Colors.grey), // Style for disabled dates
      ),
      daysOfWeekVisible: true,
      selectedDayPredicate: (day) {
        // Only show selected state for dates that are on or after the current date
        return selectedDates.any((d) => isSameDay(d, day)) && day.weekday != DateTime.sunday;
      },
      
      onDaySelected: widget.isInteractive
          ? (selectedDay, focusedDay) {
              // Check if the selected day is not a Saturday or Sunday
              if (selectedDay.weekday != DateTime.sunday && selectedDay.isAfter(DateTime(now.year, now.month, now.day)) ) {
                
                  setState(() {
                    if (selectedDates.any((d) => isSameDay(d, selectedDay))) {
                      selectedDates.removeWhere((d) => isSameDay(d, selectedDay));
                    } else {
                      selectedDates.add(selectedDay);
                    }
                  });
                  print(selectedDates);
                
              }
            }
          : null,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          if ( day.weekday == DateTime.sunday ) {
            // Disable interaction for Saturdays and Sundays
            return Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.grey), // Text style for weekends
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
          return null;
        },
        todayBuilder: (context, day, focusedDay) {
          if (selectedDates.contains(now)){
            return Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 196, 153, 108),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Text style for weekends
                ),
              ),
            );
          }
          return null;
        },
      
      ),
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

