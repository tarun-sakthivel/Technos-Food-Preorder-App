import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:food_preorder_app/Constants/Color.dart";
import "package:food_preorder_app/Constants/Text.dart";
import "package:food_preorder_app/Screens/LogPage/UserLogPage.dart";
import "package:food_preorder_app/bloc/bloc/user_log_bloc.dart";

class UserLogButton extends StatelessWidget {
  const UserLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLogBloc(),
      child: BlocListener<UserLogBloc, UserLogState>(
        listener: (context, state) {
          if (state is UserLogLoading) {
            const CircularProgressIndicator();
          } else if (state is UserLogFailed) {
          } else if (state is UserLogSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserLogPage()));
            print(state.successmessage);
          }
          // TODO: implement listener
        },
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserLogPage()));
            //context.read<UserLogBloc>().add(navigateuserlog());

            // SnackbarHelper.showSnackbar(context,
            //  title: "Not Implemented",
            //  message: "User log feature not implemented",
            //  icon: Icons.close,

            //   color: Colors.red);
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("UserLog",
                    style: Ksecondarytext.copyWith(
                        color: Khypertext,
                        decoration: TextDecoration.underline,
                        decorationColor: Khypertext,
                        decorationThickness: 1.5)),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.history,
                  color: Khypertext,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
