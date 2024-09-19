import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productTitle;
  final String productPrice;
  final String productImage;
  final String productName;
  const ProductDetailsScreen(
      {super.key,
      required this.productTitle,
      required this.productPrice,
      required this.productImage,
      required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.blueBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: lightBlueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        weight: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: customTextWidget(
                      text: productName,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
