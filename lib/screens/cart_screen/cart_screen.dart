import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/data/data.dart';
import 'package:oneline_bike_shopping_app/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:oneline_bike_shopping_app/screens/checkout_screen/checkout_screen.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_screen.dart';
import 'package:oneline_bike_shopping_app/utils/constant/app_constant.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/blue_button_widget.dart';
import 'package:oneline_bike_shopping_app/utils/widget/button_widget.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _arrowPosition = 0.0;
  double _arrowEndPosition = 0.0;
  bool isCheckoutReady = false;

  @override
  void initState() {
    super.initState();
    // Calculate positions based on screen width
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final screenWidth = MediaQuery.of(context).size.width;
        _arrowPosition = screenWidth * 0.2; // 20% of the screen width
        _arrowEndPosition = screenWidth * 0.68; // 80% of the screen width
      });
    });
  }

  void _animateArrow() {
    setState(() {
      if (_arrowPosition == _arrowEndPosition) {
        isCheckoutReady = true;
        _arrowPosition = _arrowEndPosition; // Stay at the end
        // Navigate to checkout screen
      } else {
        _arrowPosition = _arrowEndPosition; // Move to end
      }
    });
  }

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        // Remove the item from cartItems if quantity is less than 1
        cartItems.removeAt(index);
      }
    });
  }

  num _calculateTotalPrice() {
    num totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.productPrice * item.quantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    num totalPrice = _calculateTotalPrice();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ),
                        );
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
                      text: "My Shopping Cart",
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 90,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage(ImageConstant.cartImageBackground),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(cartItems[index].productImage),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTextWidget(
                            text: cartItems[index].productName,
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextWidget(
                                text:
                                    "\$ ${(cartItems[index].productPrice * cartItems[index].quantity).toStringAsFixed(2)}",
                                fontSize: 13,
                                color: const Color(0xff3C9EEA),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _increaseQuantity(index);
                                    },
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              ImageConstant.plusButton),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  customTextWidget(
                                    text: cartItems[index].quantity.toString(),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      _decreaseQuantity(index);
                                    },
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              ImageConstant.minusButton),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    width: 60,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF1A1A1A), // Dark gray
                          Color(0xFF4A4A4A), // Medium dark gray
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)), // Optional rounded corners
                    ),
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(

                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //       color: Colors.black
                          //   ),
                          // ),
                          ),
                    ),
                  ),
                ),
                customBlueButtonWidget(
                  text: "Apply",
                  onPressed: () {},
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            mediumSpaceh,
            customTextWidget(
                text: "Your bag qualifies for free shipping",
                fontSize: 15,
                color: Colors.white.withOpacity(0.6)),
            mediumSpaceh,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextWidget(
                      text: "Subtotal:",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.87)),
                  customTextWidget(
                      text: "\$ ${totalPrice.toString()}",
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.6)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextWidget(
                      text: "Delivery Fee:",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.87)),
                  customTextWidget(
                      text: "\$0",
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.6)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextWidget(
                      text: "Discount:",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.87)),
                  customTextWidget(
                      text: "${30}%",
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.6)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextWidget(
                      text: "Total:",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.87)),
                  customTextWidget(
                    text: "\$${(totalPrice * 0.7).toStringAsFixed(2)}",
                    fontSize: 17,
                    color: lightBlueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 44,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: customButtonWidget(
                      text: "Checkout",
                      onPressed: () {
                        // Directly navigate to checkout if needed
                        Navigator.pushNamed(context, '/checkout');
                      },
                      fontColor: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    left: _arrowPosition,
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: isCheckoutReady == false
                            ? _animateArrow
                            : () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CheckoutScreen(),
                                    ));
                              },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Positioned Checkout button in the center
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
