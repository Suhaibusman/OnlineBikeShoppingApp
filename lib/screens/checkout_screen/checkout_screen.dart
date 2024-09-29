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
    return Scaffold(
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close_sharp,
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
            // Shipping Address Section
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.checkoutBackgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: customTextWidget(
                  text: "Shipping \n Address",
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            mediumSpaceh,
            // Address Details Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextWidget(
                    text: "John Doe",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  smallSpaceh,
                  customTextWidget(
                    text: "123 Main Street, City, Country, 12345",
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  smallSpaceh,
                  customTextWidget(
                    text: "Phone: +1234567890",
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  smallSpaceh,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to edit address or add a new address
                      },
                      child: const Text("Change Address"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            mediumSpaceh,
            // Order Summary Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextWidget(
                    text: "Order Summary",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  mediumSpaceh,
                  _buildOrderItem(
                    context,
                    itemName: "Mountain Bike",
                    itemPrice: "\$500",
                    itemQuantity: "1",
                  ),
                  smallSpaceh,
                  _buildOrderItem(
                    context,
                    itemName: "Bike Helmet",
                    itemPrice: "\$50",
                    itemQuantity: "2",
                  ),
                  Divider(color: Colors.grey),
                  _buildTotalPriceRow(context, "Total", "\$600"),
                ],
              ),
            ),
            mediumSpaceh,
            // Payment Method Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextWidget(
                    text: "Payment Method",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  mediumSpaceh,
                  ListTile(
                    leading: Icon(Icons.credit_card, color: lightBlueColor),
                    title: customTextWidget(
                      text: "Credit/Debit Card",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: Icon(Icons.check_circle, color: lightBlueColor),
                  ),
                  ListTile(
                    leading: Icon(Icons.paypal, color: lightBlueColor),
                    title: customTextWidget(
                      text: "PayPal",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: Icon(Icons.circle_outlined),
                  ),
                ],
              ),
            ),
            mediumSpaceh,
            // Checkout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Checkout process
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightBlueColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: customTextWidget(
                  text: "Confirm Order",
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            largeSpaceh,
          ],
        ),
      ),
    );
  }

  // Helper widget for displaying each order item
  Widget _buildOrderItem(BuildContext context,
      {required String itemName, required String itemPrice, required String itemQuantity}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customTextWidget(
          text: "$itemName (x$itemQuantity)",
          fontSize: 14,
          color: Colors.grey[600],
        ),
        customTextWidget(
          text: itemPrice,
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ],
    );
  }

  // Helper widget for total price row
  Widget _buildTotalPriceRow(BuildContext context, String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customTextWidget(
          text: label,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        customTextWidget(
          text: price,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
