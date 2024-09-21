import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/constant/app_constant.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: lightBlueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      weight: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: customTextWidget(
                    text: "Checkout",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        mediumSpaceh,
          Container(

            height: MediaQuery.of(context).size.height*0.28,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.checkoutBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: customTextWidget(text: "Shipping Address" , color: Colors.white),
          )
        ],
      ),
    );
  }
}
