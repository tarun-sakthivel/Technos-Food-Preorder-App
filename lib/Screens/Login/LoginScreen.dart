import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/Widgets/DialogeBox.dart';
import 'package:food_preorder_app/Widgets/SnackBarWidget.dart';
import 'package:food_preorder_app/bloc/AuthBloc/auth_bloc.dart';
import 'package:food_preorder_app/bloc/UserLogBloc/bloc/user_log_bloc.dart';

import '../../Widgets/Button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController Usernametexteditor = TextEditingController();
  TextEditingController PasswordTextController = TextEditingController();
  String Username = '';
  String Password = '';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => UserLogBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logging in...'),
                  duration: Duration(seconds: 3),
                ),
              );
            } else if (state is AuthSuccessfull) {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else if (state is AuthFailed) {}
          },
          child: Stack(
            children: [
              Positioned(
                top: -3,
                left: 0,
                height: 165,
                width: 230,
                child: Image.asset(
                  "assets/Page_Assets/loginpage_bananna_leaf_1.png",
                  scale: 4,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/Page_Assets/loginpage_bananna_leaf_2.png",
                  scale: 4,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 120, bottom: 120, right: 16.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFC4C4C4)),
                              borderRadius: BorderRadius.circular(14),
                              color: Kivawhite.withOpacity(0.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/Icons/IVA_Logo.png'),
                                height: 100,
                                width: 237,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3.0,
                                          left: 10.0,
                                          right: 5.0,
                                          bottom: 0.0),
                                      child: Text(
                                        'Username',
                                        style: Ksecondarytext.copyWith(
                                            fontFamily: 'Poppins-ExtraLight',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0,
                                          left: 10.0,
                                          right: 5.0,
                                          bottom: 0.0),
                                      child: TextField(
                                        cursorColor: Kivagreen,
                                        controller: Usernametexteditor,
                                        onChanged: (value) {
                                          Username = value;
                                        },
                                        maxLength: null,
                                        maxLines:
                                            1, // Use 1 as a default if max_lines is null

                                        // Allow unlimited lines in the text field
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 10),
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            borderSide:
                                                BorderSide(color: Kivacream),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide:
                                                BorderSide(color: Kivacream),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, right: 15, left: 15, bottom: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0,
                                          left: 10.0,
                                          right: 5.0,
                                          bottom: 0),
                                      child: Text(
                                        'Password',
                                        style: Ksecondarytext.copyWith(
                                            fontFamily: 'Poppins-ExtraLight',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          left: 10.0,
                                          right: 5.0,
                                          bottom: 1.0),
                                      child: Container(
                                        height: 40,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              //Icon button to add the visibility icon to the password textfield
                                              icon: Icon(
                                                _obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Kivagreen,
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 3,
                                                    horizontal: 10),
                                            isDense: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              borderSide:
                                                  BorderSide(color: Kivacream),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide:
                                                  BorderSide(color: Kivacream),
                                            ),
                                          ),
                                          cursorColor: Kivagreen,
                                          obscureText: _obscureText,

                                          controller: PasswordTextController,
                                          onChanged: (value) {
                                            Password = value;
                                          },
                                          maxLength: null,
                                          maxLines:
                                              1, // Use 1 as a default if max_lines is null

                                          // Allow unlimited lines in the text field
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, top: 30),
                                child: Button(
                                  Navigation: () {
                                    context.read<AuthBloc>().add(
                                        AuthenticateUser(
                                            userName: "$Username",
                                            password: "$Password"));
                                  },
                                  fontSize: 20,
                                  textColor: Kivawhite,
                                  textStyle: 'Poppins-Medium',
                                  size: Size(174, 39),
                                  customWidget: Text(
                                    "Login",
                                    style: Ksecondarytext.copyWith(
                                      color: Kivawhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
