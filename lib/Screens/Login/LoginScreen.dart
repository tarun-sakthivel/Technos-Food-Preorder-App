import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Home/HomePage.dart';
import 'package:food_preorder_app/Widgets/Popups/DialogeBox.dart';
import 'package:food_preorder_app/Widgets/Popups/showErrorDialog.dart';
import 'package:food_preorder_app/bloc/AuthBloc/auth_bloc.dart';

import '../../Widgets/Button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

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
          if (state is GettingUserInfo) {
            Navigator.pop(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return CustomDialog(message: "Getting User info..");
              },
            );
          }
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return CustomDialog(message: "Logging in...");
              },
            );
          }
          if (state is AuthSuccessfull) {
            // Close the loading dialog
            Navigator.pop(context);
            FocusScope.of(context).unfocus(); // Dismiss keyboard if open
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route) => false,
            );
          }
          if (state is AuthFailed) {
            //remove all the loading widget or scaffold widget
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pop(context);
            return showErrorDialog(context, state.errorMessage, "Login Error");
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorDialog(title: "Error", content: "Can't able to Login check your email and password")));

            // showDialog(
            //   context: context,
            //   barrierDismissible: true,
            //   builder: (BuildContext context) {
            //     return  Dialog(
            //   child: Container(

            //   decoration: BoxDecoration(color: Kivawhite,borderRadius:BorderRadius.circular(10),border: Border.all(width: 2,color: Colors.black.withOpacity(0.5)) ),
            //     padding: EdgeInsets.all(20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [

            //         Expanded(child: Text("${state.errorMessage}",style: Ksecondarytext.copyWith(color: Colors.red),textAlign: TextAlign.center,)),
            //       ],
            //     ),
            //   ),
            //   );
            //   },
            // );
            // SnackbarHelper.showSnackbar(context, message: state.errorMessage, icon: Icons.close, color: Colors.red);
            // AlertDialog(
            //                 backgroundColor:
            //                     Color.fromARGB(104, 250, 101, 91),
            //                 content: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [

            //       Expanded(child: Text("${state.errorMessage}",style: Ksecondarytext.copyWith(color: Colors.red),textAlign: TextAlign.center,)),
            //     ],
            //   ),
            //               );
          }
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
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                      child: Container(
                        height: 560,
                        width: 323,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFC4C4C4)),
                            borderRadius: BorderRadius.circular(14),
                            color: Kivawhite.withOpacity(0.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Hero(
                              tag: "mainlogo",
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0,
                                        left: 10.0,
                                        right: 5.0,
                                        bottom: 0.0),
                                    child: Text(
                                      'Username',
                                      style: Ksecondarytext.copyWith(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.5,
                                        left: 10.0,
                                        right: 5.0,
                                        bottom: 0.0),
                                    child: TextField(
                                      inputFormatters: [
                                        VarcharTextInputFormatter()
                                      ],
                                      cursorColor: Kivagreen,
                                      controller: Usernametexteditor,

                                      keyboardType: TextInputType.text,
                                      onChanged: (value) {
                                        Username = value;
                                      },
                                      maxLength: 15,

                                      maxLines: 1,

                                      // Use 1 as a default if max_lines is null

                                      // Allow unlimited lines in the text field
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 7, horizontal: 10),
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          borderSide: const BorderSide(
                                              color: Kivacream),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Kivacream),
                                        ),
                                        counterText: '',
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
                                        top: 2.5,
                                        left: 10.0,
                                        right: 5.0,
                                        bottom: 1.0),
                                    child: SizedBox(
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
                                              const EdgeInsets.symmetric(
                                                  vertical: 3, horizontal: 10),
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            borderSide: const BorderSide(
                                                color: Kivacream),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: Kivacream),
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
                                  print(Username);
                                  print(Password);
                                  FocusScope.of(context)
                                      .unfocus(); // Dismiss keyboard
                                  context.read<AuthBloc>().add(
                                        AuthenticateUser(
                                          userName: Username,
                                          password: Password,
                                        ),
                                      );
                                },
                                fontSize: 20,
                                textColor: Kivawhite,
                                textStyle: 'Poppins',
                                size: const Size(170, 40),
                                customWidget: const Text(
                                  "Login",
                                  // style: Kmaintext.copyWith(
                                  //   fontWeight: FontWeight.w200,
                                  //   color: Kivawhite,fontSize: 20
                                  // ),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Kivawhite),
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
    );
  }
}

class VarcharTextInputFormatter extends TextInputFormatter {
  static final _varcharRegex = RegExp(r'^[\w\s\.,!?]*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_varcharRegex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
