import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:table_calendar/table_calendar.dart';

class HistorryCalendar extends StatefulWidget {
  final List<DateTime> highlightedDates;
  final bool isInteractive;
  final DateTime? selectedMonth;
  final int selectedYear;
  const HistorryCalendar({
    super.key,
    required this.selectedYear,
    required this.selectedMonth,
    required this.highlightedDates,
    this.isInteractive = false,
  });

  @override
  State<HistorryCalendar> createState() => _HistorryCalendarState();
}

class _HistorryCalendarState extends State<HistorryCalendar> {
  List<DateTime> highlightedDates = [];

  @override
  void initState() {
    super.initState();
    //highlightedDates = widget.highlightedDates;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    DateTime today = DateTime(now.year, now.month, now.day);

    // Set the focused date within the range of highlighted dates
    DateTime dateselected = widget.highlightedDates.isNotEmpty
        ? widget.highlightedDates[0]
        //? highlightedDates[0]
        : DateTime.now();
    DateTime firstDayOfMonth = DateTime(widget.selectedYear,
        int.parse(widget.selectedMonth.toString().substring(5, 7)), 1);
    DateTime lastDayOfMonth = DateTime(widget.selectedYear,
        int.parse(widget.selectedMonth.toString().substring(5, 7)) + 1, 0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Kivagreen,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 15),
            child: Text(
              'History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TableCalendar(
              firstDay: firstDayOfMonth,
              lastDay: lastDayOfMonth,
              focusedDay: DateTime(
                  widget.selectedYear,
                  int.parse(widget.selectedMonth.toString().substring(5, 7)),
                  12),
              headerStyle: const HeaderStyle(
                headerPadding: EdgeInsets.all(16),
                titleTextStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                leftChevronVisible: false,
                formatButtonVisible: false,
                rightChevronVisible: false,
              ),
              weekNumbersVisible: false,
              headerVisible: true,
              calendarFormat: CalendarFormat.month,
              availableGestures: AvailableGestures.none,
              // selectedDayPredicate: (day) {
              //   return highlightedDates.contains(day);
              // },
              calendarStyle: CalendarStyle(
                holidayTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                defaultTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                cellMargin: const EdgeInsets.all(0),
                isTodayHighlighted: false,
                outsideDaysVisible: false,
                outsideDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) {
                  final daysOfWeek = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  return daysOfWeek[date.weekday - 1];
                },
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (widget.highlightedDates.any((d) => isSameDay(d, day))) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Kivawhite, width: 2),
                        color: Kgrey,
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
                  return Center(
                    child: Text(
                      '${day.day}',
                      style: Kcalendartext.copyWith(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
