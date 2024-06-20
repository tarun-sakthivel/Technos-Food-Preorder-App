import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Login/LoginScreen.dart';
import 'package:food_preorder_app/bloc/UserLogBloc/bloc/user_log_bloc.dart';

class UserLogPage extends StatefulWidget {
  const UserLogPage({super.key});

  @override
  State<UserLogPage> createState() => _UserLogPageState();
}

class _UserLogPageState extends State<UserLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "UserLog History",
          style: Kmaintext.copyWith(color: Kivagreen, fontSize: 20),
        ),
        flexibleSpace: Stack(children: [
          Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: Image.asset("assets/Page_Assets/appbar_bananna_leaf.png"))
        ]),
        actions: [
          IconButton(
              onPressed: () {
                // SnackbarHelper.showSnackbar(context,
                // title: "Not implemented!!",
                // message: "Logout function not yet implemented yet ",
                // icon: Icons.dangerous_outlined,
                // color: Colors.red);
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
              icon: Icon(Icons.logout_outlined, color: Kivawhite)),
        ],
      ),
      body: BlocProvider(
        create: (context) => UserLogBloc(),
        child: BlocListener<UserLogBloc, UserLogState>(
          listener: (context, state) {
            if (state is UserLogLoading) {
              CircularProgressIndicator();
            } else if (state is UserLogFailed) {
            } else if (state is UserLogSuccess) {
              print(state.successmessage);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose the month and year",
                  style: Kmaintext.copyWith(
                      fontSize: 15, color: Color(0xFF666666)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
