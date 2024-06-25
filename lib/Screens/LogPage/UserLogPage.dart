import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/Screens/LogPage/Historypage.dart';
import 'package:food_preorder_app/Screens/Login/LoginScreen.dart';
import 'package:food_preorder_app/Widgets/Calendars/Monthcalendar.dart';
import 'package:food_preorder_app/Widgets/CalenderUserLog.dart';
import 'package:food_preorder_app/bloc/bloc/user_log_bloc.dart';
import 'package:food_preorder_app/dates.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class UserLogPage extends StatefulWidget {
  final DateTime initialDate;
  const UserLogPage({super.key, required this.initialDate});

  @override
  State<UserLogPage> createState() => _UserLogPageState();
}

class _UserLogPageState extends State<UserLogPage> {
  DateTime? selectedDate;
  Set<DateTime?> selecteddates = {};
  Set<DateTime> selecteddatees = {
    DateTime(2023, 6, 5),
    DateTime(2023, 6, 12),
    DateTime(2023, 6, 18),
    DateTime(2023, 6, 25),
  };
  @override
  void initState() {
    selectedDate = widget.initialDate;
    // TODO: implement initState
    super.initState();
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
        backgroundColor: Kivawhite,
        appBar: AppBar(
            leadingWidth: 26,
            automaticallyImplyLeading: false,
            title: Text(
              "UserLog History",
              style: Kmaintext.copyWith(
                  color: Kivagreen, fontSize: 20, fontWeight: FontWeight.w200),
            ),
            flexibleSpace: Stack(children: [
              Positioned(
                  right: -25,
                  bottom: 0,
                  top: 0,
                  child:
                      Image.asset("assets/Page_Assets/appbar_bananna_leaf.png"))
            ]),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                icon: Icon(
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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose the month and year",
                  style: Kmaintext.copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                      color: Color(0xFF666666)),
                ),
              ),
              Center(
                child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black)),
                    child: CalendarPage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
