import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/product_details_screen.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class SmallImageWidget extends StatelessWidget {
  final String productTitle;
  final String productPrice;
  final String productImage;
  final String productName;
  const SmallImageWidget(
      {super.key,
      required this.productTitle,
      required this.productPrice,
      required this.productImage,
      required this.productName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productTitle: productTitle,
              productPrice: productPrice,
              productImage: productImage,
              productName: productName,
            ),
          ),
        );
      },
      child: Container(
        height: 213,
        width: 165,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.smallImageBackground),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                productImage,
                height: 70,
                width: 100, // And also the width
                // fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextWidget(
                    text: productName,
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  customTextWidget(
                    text: productTitle,
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                  customTextWidget(
                    text: productPrice,
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
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
