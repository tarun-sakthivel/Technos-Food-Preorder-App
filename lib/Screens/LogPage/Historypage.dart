import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/Screens/LogPage/UserLogPage.dart';
import 'package:food_preorder_app/Widgets/Calendars/HistoryCalendar.dart';
import 'package:food_preorder_app/Widgets/Popups/showErrorDialog.dart';
import 'package:food_preorder_app/bloc/HistoryBloc/history_bloc_bloc.dart';
import 'package:food_preorder_app/bloc/bloc/user_log_bloc.dart';
import 'package:food_preorder_app/dates.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  Set<DateTime> selecteddatees = {
    DateTime(2023, 6, 5),
    DateTime(2023, 6, 12),
    DateTime(2023, 6, 18),
    DateTime(2023, 6, 25),
  };
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
      home: BlocBuilder<HistoryBlocBloc, HistoryBlocState>(
        builder: (context, state) {
          if (state is UserLogSuccess) {
            return BlocListener<UserLogBloc, UserLogState>(
              listener: (context, state) {
                if (state is backbutton) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserLogPage(initialDate: DateTime.now())));
                }
                // TODO: implement listener
              },
              child: Scaffold(
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
                          context.read<UserLogBloc>().add(navigateuserlog());
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
                              "June 2024",
                              style: Kmaintext.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "No. of days:",
                                  style: Kmaintext.copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${future_dates.length}',
                                    style: Kmaintext.copyWith(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 0, 0, 0)),
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
                        child:
                            HistorryCalendar(highlightedDates: selecteddatees),
                      ),
                    ],
                  ),
                ),
              ),
            );
            ;
          } else if (state is dataFailed) {
            showErrorDialog(context, 'Data not present', 'Error occured');
          }
          return Scaffold(
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
                      context.read<UserLogBloc>().add(navigateuserlog());
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
                          "June 2024",
                          style: Kmaintext.copyWith(
                              fontWeight: FontWeight.w100,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "No. of days:",
                              style: Kmaintext.copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${future_dates.length}',
                                style: Kmaintext.copyWith(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0)),
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
                    child: HistorryCalendar(highlightedDates: selecteddatees),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
