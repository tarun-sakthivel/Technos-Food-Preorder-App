import "package:flutter/material.dart";
import "package:food_preorder_app/Constants/Color.dart";
import "package:food_preorder_app/Constants/Text.dart";
import "package:food_preorder_app/Screens/LogPage/UserLogPage.dart";

class UserLogButton extends StatelessWidget {
  const UserLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime> selecteddatees = [
      DateTime(2023, 6, 5),
      DateTime(2023, 6, 12),
      DateTime(2023, 6, 18),
      DateTime(2023, 6, 25),
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserLogPage(
                      initialDate: DateTime.now(),
                    )));
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
    );
  }
}
