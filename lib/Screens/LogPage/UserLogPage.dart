
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/Widgets/Calendars/Monthcalendar.dart';

class UserLogPage extends StatefulWidget {
  const UserLogPage({super.key});

  @override
  State<UserLogPage> createState() => _UserLogPageState();
}

class _UserLogPageState extends State<UserLogPage> {
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
      home: Scaffold(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose the month and year",
                  style: Kmaintext.copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                      color: const Color(0xFF666666)),
                ),
              ),
              SizedBox(
                height: 393,
                width: 400,
                child: MonthPickerExample(initialDate: DateTime.now()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
