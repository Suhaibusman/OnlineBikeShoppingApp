import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/data/data.dart';
import 'package:oneline_bike_shopping_app/domain/product_model.dart';
import 'package:oneline_bike_shopping_app/screens/cart_screen/cart_screen.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/blue_button_widget.dart';
import 'package:oneline_bike_shopping_app/utils/widget/button_widget.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productData;

  const ProductDetailsScreen(
      {super.key,
      required this.productData,
    });

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Icons.arrow_back_ios,
                        weight: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: customTextWidget(
                      text: productData.productName,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image(image: AssetImage(productData.productImage)),

            Container(
              height: 110,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customButtonWidget(
                    text: "Description",
                    fontColor: Colors.white.withOpacity(0.6),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 450,
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.9),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customButtonWidget(
                                    text: "Description",
                                    fontColor: lightBlueColor,
                                    fontWeight: FontWeight.bold,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  customButtonWidget(
                                    text: "Specification",
                                    fontColor: Colors.white.withOpacity(0.6),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customTextWidget(
                                      text: productData.productName,
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextWidget(
                                        text:
                                            "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.",
                                        color: Colors.white.withOpacity(0.6),
                                        lineheight: 1.2,
                                        fontSize: 15),
                                  ],
                                ),
                              ),
                              Container(
                                height: 104,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    customTextWidget(text: "\$ ${productData.productPrice}" , color: lightBlueColor ,fontSize: 24 , ),
                                    const SizedBox(width: 30,),
                                    customBlueButtonWidget(
                                      text: "Add to Cart",
                                      onPressed: () {
                                        bool found = false;
                                        for (var item in cartItems) {
                                          if (item.productName == productData.productName) {
                                            found = true;
                                            // Show the dialog to confirm increasing quantity
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: customTextWidget(text: "This Product is Already in Cart" , fontSize: 20),
                                                content: customTextWidget(text: "Do you want to increase the quantity?" , ),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      customButtonWidget(
                                                        buttonWidth: 100,
                                                        text: "Yes",
                                                        onPressed: () {
                                                          item.quantity++; // Increase quantity by 1
                                                        print("cart items $cartItems");
                                                          print("Cart Items :${cartItems.first.quantity}");
                                                          Navigator.pop(context); // Close the dialog
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                                                        },
                                                        fontColor: Colors.white,
                                                      ),
                                                      const SizedBox(width: 20,),
                                                      customButtonWidget(
                                                        buttonWidth: 100,
                                                        text: "No",
                                                        onPressed: () {
                                                          Navigator.pop(context); // Close the dialog without doing anything
                                                        },
                                                        fontColor: Colors.white,
                                                      ),
                                                    ],
                                                  )

                                                ],
                                              ),
                                            );
                                            break; // Break the loop as we found the item
                                          }
                                        }

                                        // If the product wasn't found in the cart, add it
                                        if (!found) {
                                          cartItems.add(ProductModel(
                                            productName: productData.productName,
                                            productPrice: productData.productPrice,
                                            productDetails: productData.productDetails,
                                            productImage: productData.productImage,
                                            productDescription: productData.productDescription,
                                            quantity: 1, // Initialize quantity for new item
                                          ));
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                                        }

                                        print("Cart Items: $cartItems");
                                        print("Cart Items :${cartItems.first.quantity}");
                                      },
                                      fontColor: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  customButtonWidget(
                    text: "Specification",
                    fontColor: Colors.white.withOpacity(0.6),
                    onPressed: () {},
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
