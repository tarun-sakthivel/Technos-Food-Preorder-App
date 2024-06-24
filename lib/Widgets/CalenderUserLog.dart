import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/LogPage/UserLogPage.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class CalenderUserLog extends StatefulWidget {
  DateTime initialDate = DateTime.now();
  CalenderUserLog({super.key});

  @override
  State<CalenderUserLog> createState() => _CalenderUserLogState();
}

class _CalenderUserLogState extends State<CalenderUserLog> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showMonthPicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5, 5),
        lastDate: DateTime(DateTime.now().year + 8, 9),
        initialDate: selectedDate ?? widget.initialDate,
        locale: const Locale('en'),
        headerColor: Kivagreen,
        headerTextColor: Colors.white,
        selectedMonthBackgroundColor: Kivagreen,
        selectedMonthTextColor: Colors.white,
        unselectedMonthTextColor: Colors.black,
        currentMonthTextColor: Colors.black,
        confirmWidget: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserLogPage()));
          },
          child: Text(
            'ok',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        cancelWidget: Text(
          'Cancel',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        roundedCornersRadius: 14,
        yearFirst: false,
        backgroundColor: Colors.white,
        buttonBorder: const RoundedRectangleBorder(),
        headerTitle: const Text(
          'Filter',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Calender User Log'),
      ),
    );
  }
}
