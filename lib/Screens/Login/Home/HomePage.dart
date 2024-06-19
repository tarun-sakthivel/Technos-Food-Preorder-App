import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Login/LoginScreen.dart';
import 'package:food_preorder_app/Widgets/OrdersWidget.dart';
import 'package:food_preorder_app/Widgets/SnackBarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/Icons/IVA_Logo.png",
            scale: 4,
          ),
          flexibleSpace: Stack(children: [
            Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child:
                    Image.asset("assets/Page_Assets/appbar_bananna_leaf.png"))
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Loginscreen())); //Have to make changes after getting the API keys-------------------
                  // SnackbarHelper.showSnackbar(context, title: "Not implemented!!", message: "Logout function not yet implemented yet ", icon: Icons.dangerous_outlined, color: Colors.red);
                },
                icon: const Icon(Icons.logout_outlined, color: Kivawhite)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello Technos", style: Kmaintext),
              const SizedBox(height: 16),
              NumberOfOrders(numberOfOrders: "24"),
            ],
          ),
        ));
  }
}
