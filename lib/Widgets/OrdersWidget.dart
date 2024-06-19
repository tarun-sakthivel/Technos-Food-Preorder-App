import "package:flutter/material.dart";
import "package:food_preorder_app/Constants/Text.dart";



class NumberOfOrders extends StatelessWidget {
  String numberOfOrders;
  NumberOfOrders({super.key,
  required this.numberOfOrders});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          height: 95,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 98, 98, 98).withOpacity(0.3), // Shadow color
                      spreadRadius: 0.7, // How wide the shadow should be
                      blurRadius: 4, // How soft the shadow should be
                      offset: const Offset(1, 2.5), // Changes position of shadow
                    ),
                    ],
          ),
          child: Stack(
            children: [
              Positioned(
                left:0,
                bottom:0,
                
                child: Opacity(
                  opacity: 1,
                  child: Image.asset("assets/Page_Assets/waiter_home_page_watermark.png",
                  scale: 3,
                  )),
              ),
              Positioned(
                bottom: 0,
                
                left: 0,
                child: Image.asset(
                  "assets/Page_Assets/waiter_home_page.png",
                  scale:4
                ),
              ),
              Positioned(
                bottom: 0,
                
                right: 0,
                child: Image.asset(
                  "assets/Page_Assets/bananna_leaf_home_page.png",
                  scale:4
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
                    Text(
                      "Orders",
                      style: Ksecondarytext.copyWith(fontSize: 20),
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



