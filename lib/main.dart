import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/bloc/AuthBloc/auth_bloc.dart';
import 'package:food_preorder_app/bloc/CalendarBloc/bloc/calendar_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
      BlocProvider(create: (context) => AuthBloc()),
      BlocProvider(create: (context) => CalendarBloc()),
     ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
