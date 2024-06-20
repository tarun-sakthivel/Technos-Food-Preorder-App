import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/Widgets/DialogeBox.dart';
import 'package:food_preorder_app/Widgets/SnackBarWidget.dart';
import 'package:food_preorder_app/bloc/AuthBloc/auth_bloc.dart';

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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return CustomDialog(message: "Logging in...");
              },
            );
          } else if (state is AuthSuccessfull) {
            // Close the loading dialog
            //FocusScope.of(context).unfocus(); // Dismiss keyboard if open
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route)=> true,
            );
          } else if (state is AuthFailed) {
            SnackbarHelper.showSnackbar(
              context,
              message: state.errorMessage,
              icon: Icons.close,
              color: Colors.red,
            );
          }
        },
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        color: Kivawhite.withOpacity(0.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: Image.asset(
                              'assets/Icons/IVA_Logo.png',
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
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: Kivacream),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 3.0,
                                      left: 10.0,
                                      right: 5.0,
                                      bottom: 3.0,
                                    ),
                                    child: TextField(
                                      controller: Usernametexteditor,
                                      onChanged: (value) {
                                        setState(() {
                                          Username = value;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type Here....',
                                        hintStyle: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
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
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: Kivacream),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 3.0,
                                      left: 10.0,
                                      right: 5.0,
                                      bottom: 3.0,
                                    ),
                                    child: TextField(
                                      obscureText: _obscureText,
                                      controller: PasswordTextController,
                                      onChanged: (value) {
                                        setState(() {
                                          Password = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type Here....',
                                        hintStyle: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: IconButton(
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              top: 30,
                            ),
                            child: Button(
                              Navigation: () {
                                FocusScope.of(context).unfocus(); // Dismiss keyboard
                                context.read<AuthBloc>().add(
                                      AuthenticateUser(
                                        userName: Username,
                                        password: Password,
                                      ),
                                    );
                              },
                              fontSize: 20,
                              textColor: Kivawhite,
                              textStyle: 'Poppins-Medium',
                              size: Size(170, 40),
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
