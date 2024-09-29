import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Add Lottie package for animations
import 'package:oneline_bike_shopping_app/screens/auth_screen/login_screen/login_screen.dart';
import 'package:oneline_bike_shopping_app/utils/constant/app_constant.dart';
import 'package:oneline_bike_shopping_app/utils/widget/blue_button_widget.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Container with Custom Shape and Lottie Animation
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                // Lottie animation

                Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/cycleJson1.json', // Add the appropriate Lottie file here
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                // Custom shape at the bottom

              ],
            ),
          ),

          // Bottom Container with Text and Button
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title text
                  customTextWidget(
                    text: "Shop Your Dream Bike Effortlessly",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  mediumSpaceh,
                  // Description text
                  customTextWidget(
                    text: "Browse and purchase your dream bike from a wide range of collections. Easy and secure shopping!",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  mediumSpaceh,
                  const Spacer(),
                  // Get Started button
                  customBlueButtonWidget(
                    text: "Get Started",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    fontColor: Colors.white,
                    buttonHeight: 50,
                    fontWeight: FontWeight.w600,
                    // backgroundColor: primaryColor, // Button color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for a wave-like effect at the bottom of the top container
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(size.width / 4, size.height - 20);
    var firstEndPoint = Offset(size.width / 2, size.height - 10);
    var secondControlPoint = Offset(3 * (size.width / 4), size.height);
    var secondEndPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
