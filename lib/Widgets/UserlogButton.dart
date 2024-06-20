import "package:flutter/material.dart";
import "package:food_preorder_app/Constants/Color.dart";
import "package:food_preorder_app/Constants/Text.dart";
import "package:food_preorder_app/Widgets/SnackBarWidget.dart";

class UserLogButton extends StatelessWidget {
  const UserLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SnackbarHelper.showSnackbar(context,
         title: "Not Implemented",
         message: "User log feature not implemented", 
         icon: Icons.close,
         
          color: Colors.red);
      },
      child: Container(
        child: Row(
          children: [
            Text("UserLog",style:Ksecondarytext.copyWith(color:Khypertext)),
            
            const Icon(Icons.history,color:Khypertext),
          ],
        ),
      ),
    );
  }
}