import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/bloc/AuthBloc/auth_bloc.dart';

import '../../Widgets/Button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessfull) {
              } else if (state is AuthFailed) {}
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: Image(
                            image: AssetImage(
                                'assets/Page_Assets/appbar_bananna_leaf.png')))
                  ],
                ),
                Center(
                    child: Button(
                        fontSize: 16,
                        textColor: Kivawhite,
                        textStyle: 'Poppins-Medium',
                        height: 40,
                        width: 120,
                        text: "Login"))
              ],
            ),
          )),
    );
  }
}
