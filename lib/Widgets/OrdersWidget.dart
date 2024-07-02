import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Text.dart'; // Assuming Kmaintext and Ksecondarytext are defined here

class NumberOfOrders extends StatelessWidget {
  late  int numberOfOrders;

  NumberOfOrders({
    super.key,
    required this.numberOfOrders,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
       boxShadow: [
              BoxShadow(
                color:const Color.fromARGB(255, 178, 178, 178).withOpacity(0.4),
                spreadRadius: -1,
                blurRadius: 12.3,
                offset:const Offset(2,-2),
              ),
            ],),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
       
        child: Container(
          height: 95, // Adjust height as necessary
          width: double.infinity,
          decoration: const BoxDecoration(
           
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     color:const Color.fromARGB(255, 45, 45, 45).withOpacity(0.9),
            //     spreadRadius: 8,
            //     blurRadius: 20,
            //     offset:const Offset(2,10),
            //   ),
            // ],
          ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.6,
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
                      numberOfOrders.toString(),
                      //style: Kmaintext.copyWith(fontSize: 40,fontWeight: FontWeight.w400),
                      style:const TextStyle(fontSize: 45,fontWeight: FontWeight.w500,color: Colors.black),
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
      ),
    );
  }
}
