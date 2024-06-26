import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/LogPage/UserLogPage.dart';
import 'package:food_preorder_app/Widgets/Calendars/HistoryCalendar.dart';
import 'package:food_preorder_app/Widgets/Popups/showErrorDialog.dart';
import 'package:food_preorder_app/bloc/HistoryBloc/history_bloc_bloc.dart';
import 'package:food_preorder_app/bloc/bloc/user_log_bloc.dart';
import 'package:food_preorder_app/dates.dart';

class Historypage extends StatefulWidget {
  DateTime? selectedmonth;
  int yearSelected;
  Historypage(
      {super.key, required this.selectedmonth, required this.yearSelected});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  List<DateTime> selecteddatees = [
    DateTime(2023, 6, 5),
    DateTime(2023, 6, 12),
    DateTime(2023, 6, 18),
    DateTime(2023, 6, 25),
  ];

  monthSelected(String selectedMonth) {
    print(selectedMonth);
    if (selectedMonth == '01') {
      selectedMonth = 'January';
    } else if (selectedMonth == '02') {
      selectedMonth = 'Feburary';
    } else if (selectedMonth == '03') {
      selectedMonth = 'March';
    } else if (selectedMonth == '04') {
      selectedMonth = 'April';
    } else if (selectedMonth == '05') {
      selectedMonth = 'May';
    } else if (selectedMonth == '06') {
      selectedMonth = 'June';
    } else if (selectedMonth == '07') {
      selectedMonth = 'July';
    } else if (selectedMonth == '08') {
      selectedMonth = 'August';
    } else if (selectedMonth == '09') {
      selectedMonth = 'September';
    } else if (selectedMonth == '10') {
      selectedMonth = 'October';
    } else if (selectedMonth == '11') {
      selectedMonth = 'November';
    } else if (selectedMonth == '12') {
      selectedMonth = 'December';
    } else {
      selectedMonth = selectedMonth;
    }
    return selectedMonth;
    print(selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en'),
          Locale('zh'),
          Locale('fr'),
          Locale('es'),
          Locale('de'),
          Locale('ru'),
          Locale('ja'),
          Locale('ar'),
          Locale('fa'),
          Locale('es'),
          Locale('it'),
        ],
        home: Scaffold(
          appBar: AppBar(
              leadingWidth: 26,
              automaticallyImplyLeading: false,
              title: Text(
                "UserLog History",
                style: Kmaintext.copyWith(
                    color: Kivagreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              ),
              flexibleSpace: Stack(children: [
                Positioned(
                    right: -25,
                    bottom: 0,
                    top: 0,
                    child: Image.asset(
                        "assets/Page_Assets/appbar_bananna_leaf.png"))
              ]),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.navigate_before,
                    size: 28,
                    color: Kivagreen,
                  ))),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${monthSelected(widget.selectedmonth.toString().substring(5, 7))}" +
                            "  ${widget.yearSelected}",
                        style: Kmaintext.copyWith(
                            fontWeight: FontWeight.w100,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No. of days:",
                            style: Kmaintext.copyWith(
                                fontWeight: FontWeight.w100,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '${future_dates.length}',
                              style: Kmaintext.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  width: 400,
                  child: HistorryCalendar(
                    highlightedDates: selecteddatees,
                    selectedMonth: monthSelected(
                        widget.selectedmonth.toString().substring(5, 7)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
