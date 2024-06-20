import 'package:flutter/material.dart';
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
    selectedDates = List.from(widget.highlightedDates);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
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
      calendarStyle: const CalendarStyle(
        outsideDaysVisible: true, // Show outside days for next month
        holidayDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        disabledTextStyle: TextStyle(color: Colors.grey), // Style for disabled dates
      ),
      daysOfWeekVisible: true,
      selectedDayPredicate: (day) {
        // Only show selected state for dates that are on or after the current date
        return day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
               selectedDates.any((d) => isSameDay(d, day)) && day.weekday != DateTime.saturday  &&day.weekday != DateTime.sunday;
      },
      onDaySelected: widget.isInteractive
          ? (selectedDay, focusedDay) {
              // Check if the selected day is not a Saturday or Sunday
              if (selectedDay.weekday != DateTime.saturday && selectedDay.weekday != DateTime.sunday &&selectedDay.isAfter(DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1))) ) {
                
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
          if (day.weekday == DateTime.saturday || day.weekday == DateTime.sunday || hasWeekendsOrPastDates(day)) {
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

          if (selectedDates.any((d) => isSameDay(d, day))) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.white),
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


bool hasWeekendsOrPastDates(DateTime date) {
    return date.weekday == DateTime.saturday ||
           date.weekday == DateTime.sunday ||
           date.isBefore(DateTime.now());
  }