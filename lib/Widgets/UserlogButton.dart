import "package:flutter/material.dart";
import "package:food_preorder_app/Constants/Color.dart";
import "package:food_preorder_app/Constants/Text.dart";
import "package:food_preorder_app/Screens/LogPage/UserLogPage.dart";
import "package:food_preorder_app/Widgets/CalenderUserLog.dart";
import "package:food_preorder_app/Widgets/SnackBarWidget.dart";

class UserLogButton extends StatelessWidget {
  const UserLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserLogPage()));
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
            SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.history,
              color: Khypertext,
            ),
          ],
        ),
      ),
    );
  }
}
