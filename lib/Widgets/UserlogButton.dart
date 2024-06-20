import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:food_preorder_app/Constants/Color.dart";
import "package:food_preorder_app/Constants/Text.dart";
import "package:food_preorder_app/Screens/LogPage/UserLogPage.dart";
import "package:food_preorder_app/Widgets/SnackBarWidget.dart";
import "package:food_preorder_app/bloc/UserLogBloc/bloc/user_log_bloc.dart";

class UserLogButton extends StatelessWidget {
  const UserLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UserLogBloc>();
        //Navigator.push(
        //  context, MaterialPageRoute(builder: (context) => UserLogPage()));
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
            Text("UserLog", style: Ksecondarytext.copyWith(color: Khypertext)),
            const Icon(Icons.history, color: Khypertext),
          ],
        ),
      ),
    );
  }
}
