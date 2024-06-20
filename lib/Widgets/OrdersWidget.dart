import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Text.dart'; // Assuming Kmaintext and Ksecondarytext are defined here

class NumberOfOrders extends StatelessWidget {
  final String numberOfOrders;

  const NumberOfOrders({
    super.key,
    required this.numberOfOrders,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 95, // Adjust height as necessary
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 98, 98, 98).withOpacity(0.3),
              spreadRadius: 0.7,
              blurRadius: 4,
              offset: const Offset(1, 2.5),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  "assets/Page_Assets/waiter_home_page_watermark.png",
                  scale: 3,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                "assets/Page_Assets/waiter_home_page.png",
                scale: 4,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                "assets/Page_Assets/bananna_leaf_home_page.png",
                scale: 4,
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    numberOfOrders,
                    style: Kmaintext.copyWith(fontSize: 40),
                  ),
                  const SizedBox(width: 8), // Adjust spacing between text widgets
                  Text(
                    "Orders",
                    style: Ksecondarytext,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
