import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Screens/Login/LoginScreen.dart';
import 'package:food_preorder_app/bloc/AuthBloc/auth_bloc.dart';
import 'package:food_preorder_app/bloc/CalendarBloc/bloc/calendar_bloc.dart';
import 'package:food_preorder_app/bloc/HistoryBloc/history_bloc_bloc.dart';
import 'package:food_preorder_app/bloc/bloc/user_log_bloc.dart';
import 'package:food_preorder_app/bloc/infoBloc/info_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
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
        BlocProvider(create: (context) => UserLogBloc()),
        BlocProvider(create: (context) => HistoryBlocBloc()),
        BlocProvider(create: (context) => InfoBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Loginscreen(),
      ),
    );
  }
}
