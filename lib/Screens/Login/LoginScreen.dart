import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Login/Home/HomePage.dart';
import 'package:food_preorder_app/Widgets/SnackBarWidget.dart';
import 'package:food_preorder_app/bloc/AuthBloc/auth_bloc.dart';

import '../../Widgets/Button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController Usernametexteditor = TextEditingController();
  String Username = '';
  TextEditingController PasswordTextController = TextEditingController();
  String Password = '';
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            AlertDialog(
              backgroundColor: Color.fromARGB(104, 250, 101, 91),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text("logging in...", style: TextStyle(color: Colors.white)),
                ],
              ),
            );
          } else if (state is AuthSuccessfull) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (state is AuthFailed) {}
        },
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -3,
                left: 0,
                child: Image.asset(
                  "assets/Page_Assets/loginpage_bananna_leaf_1.png",
                  scale: 4,
                ),
                height: 165,
                width: 230,
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
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ClipRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(
                      height: 570,
                      width: 400,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 14.0,
                              spreadRadius: 2.0,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                          border: Border.all(color: const Color(0xFFC4C4C4)),
                          borderRadius: BorderRadius.circular(15),
                          color: Kivawhite.withOpacity(0.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 60.0,
                            ),
                            child: Image(
                              image: AssetImage('assets/Icons/IVA_Logo.png'),
                              height: 100,
                              width: 237,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  style: Ksecondarytext.copyWith(
                                      color: Colors.black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: Kivacream)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0,
                                        left: 10.0,
                                        right: 5.0,
                                        bottom: 3.0),
                                    child: TextField(
                                      controller: Usernametexteditor,
                                      onChanged: (value) {
                                        Username = value;
                                      },
                                      maxLength: null,
                                      maxLines:
                                          1, // Use 1 as a default if max_lines is null

                                      // Allow unlimited lines in the text field
                                      decoration: const InputDecoration(
                                          border: InputBorder
                                              .none, // Remove default border
                                          hintText: 'Type Here....',
                                          hintStyle: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: Ksecondarytext.copyWith(
                                      color: Colors.black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: Kivacream)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0,
                                        left: 10.0,
                                        right: 5.0,
                                        bottom: 3.0),
                                    child: TextField(
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                        border: InputBorder
                                            .none, // Remove default border
                                        hintText: 'Type Here....',
                                        hintStyle: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                        suffixIcon: IconButton(
                                          //Icon button to add the visibility icon to the password textfield
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Kivagreen,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                      ),
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
                            padding: const EdgeInsets.only(bottom: 8, top: 30),
                            child: Button(
                                Navigation: () {
                                  context.read<AuthBloc>().add(AuthenticateUser(
                                      userName: "$Username",
                                      password: "$Password"));
                                },
                                fontSize: 20,
                                textColor: Kivawhite,
                                textStyle: 'Poppins-Medium',
                                size: Size(170, 40),
                                text: "Login"),
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
