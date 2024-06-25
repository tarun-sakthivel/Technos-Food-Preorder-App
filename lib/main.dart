import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Screens/LogPage/UserLogPage.dart';
import 'package:food_preorder_app/bloc/bloc/user_log_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLogBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserLogPage(),
      ),
    );
  }
}
