import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Login/LoginScreen.dart';
import 'package:food_preorder_app/Widgets/HomeScreenCalendarView.dart';
import 'package:food_preorder_app/Widgets/OrdersWidget.dart';
import 'package:food_preorder_app/Widgets/UserlogButton.dart';

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
          automaticallyImplyLeading: false,
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
                  // SnackbarHelper.showSnackbar(context,
                  // title: "Not implemented!!",
                  // message: "Logout function not yet implemented yet ",
                  // icon: Icons.dangerous_outlined,
                  // color: Colors.red);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Loginscreen()), (route)=>true);
                },
                icon: Icon(Icons.logout_outlined, color: Kivawhite)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello Technos", style: Kmaintext),
              const SizedBox(height: 24),
              NumberOfOrders(numberOfOrders: "24"),
              const SizedBox(height: 24),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Your orders:",
                        style: Ksecondarytext.copyWith(
                            fontWeight: FontWeight.w500)),
                    const UserLogButton(),
                  ]),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaticCalendar(
                    highlightedDates: [
                      DateTime(2024, 6, 5),
                      DateTime(2024, 6, 25),
                      DateTime(2024, 6, 19),
                    ],
                    isInteractive: true,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
