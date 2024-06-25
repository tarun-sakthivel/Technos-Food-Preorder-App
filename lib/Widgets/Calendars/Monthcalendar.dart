
import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/LogPage/Historypage.dart';
import 'package:food_preorder_app/dates.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class Monthcalendar extends StatefulWidget {
  final Set<DateTime> highlightedDates;
  final bool isInteractive;
  const Monthcalendar({
    super.key,
    required this.highlightedDates,
    this.isInteractive = false,
  });

  @override
  State<Monthcalendar> createState() => _MonthcalendarState();
}

class _MonthcalendarState extends State<Monthcalendar> {
  Set<DateTime> selecteddatees = {
    DateTime(2023, 6, 5),
    DateTime(2023, 6, 12),
    DateTime(2023, 6, 18),
    DateTime(2023, 6, 25),
  };
  @override
  void initState() {
    super.initState();
    // getFutureDates(widget.highlightedDates);
    // // selectedDates = List.from(widget.highlightedDates);
    // selectedDates = future_dates;
  }

  @override
  Widget build(BuildContext context) {
    getFutureDates(dates);

    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    print("today $today");
    //print(selectedDates.contains(today));
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Check if the current date has crossed the 15th
    if (now.day > 15) {
      // Display next month fully
      lastDayOfMonth = DateTime(now.year, now.month + 2, 0);
    }

    return Container(
      child: MonthPickerExample(initialDate: DateTime.now()),
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class MonthPickerExample extends StatefulWidget {
  final DateTime initialDate;

  const MonthPickerExample({super.key, required this.initialDate});

  @override
  _MonthPickerExampleState createState() => _MonthPickerExampleState();
}

class _MonthPickerExampleState extends State<MonthPickerExample> {
  DateTime? selectedDate;
  Set<DateTime?> selecteddates = {};
  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showMonthPicker(context).then((date) {
        if (date != null) {
          setState(() {
            selectedDate = date;
          });
        }
      });
    });
  }

  Future<DateTime?> _showMonthPicker(BuildContext context) {
    return showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5, 5),
      lastDate: DateTime(DateTime.now().year + 8, 9),
      initialDate: selectedDate ?? widget.initialDate,
      locale: const Locale('en'),
      headerColor: Kivagreen,
      forceSelectedDate: false,
      headerTextColor: Kivawhite,
      selectedMonthBackgroundColor: Kivagreen,
      selectedMonthTextColor: Colors.white,
      unselectedMonthTextColor: Colors.black,
      currentMonthTextColor: Colors.black,
      dismissible: false,
      confirmWidget: ElevatedButton(
          onPressed: () {
            selecteddates.add(selectedDate);

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Historypage()));
          },
          child: Text(
            'OK',
            style: Ksecondarytext,
          )),
      roundedCornersRadius: 15,
      yearFirst: false,
      backgroundColor: Colors.blueGrey[50],
      buttonBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100))),
      headerTitle: const Text(
        'Filter',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(''),
      ),
    );
  }
}
