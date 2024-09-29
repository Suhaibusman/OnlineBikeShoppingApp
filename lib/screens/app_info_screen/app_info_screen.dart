import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

 // Define your primary color here

// Custom Text Widge
class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customTextWidget(
          text: 'About the App',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Adding shapes as background decorations
          Positioned(
            top: -50,
            left: -50,
            child: _buildCircleShape(120, Colors.blue.withOpacity(0.3)),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: _buildCircleShape(120, Colors.green.withOpacity(0.3)),
          ),
          Positioned(
            top: 120,
            left: -100,
            child: _buildDiagonalShape(300, 200, primaryColor.withOpacity(0.2)),
          ),
          Positioned(
            bottom: 150,
            right: -80,
            child: _buildDiagonalShape(300, 200, Colors.purple.withOpacity(0.2)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Logo
                Center(
                  child: Image.asset(
                    'assets/logo.png', // Add your app logo here
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(height: 20),

                // App Name and Version
                Center(
                  child: customTextWidget(
                    text: 'BikeShop',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: customTextWidget(
                    text: 'Version 1.0.0',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),

                // About the App
                customTextWidget(
                  text: 'About the App',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                customTextWidget(
                  text:
                  'BikeShop is a comprehensive platform that allows you to browse, compare, and purchase your favorite bikes with ease.',
                  fontSize: 16,
                ),
                SizedBox(height: 20),

                // Developer Info
                customTextWidget(
                  text: 'Developed by',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                customTextWidget(
                  text: 'BikeShop Inc.',
                  fontSize: 16,
                ),
                customTextWidget(
                  text: 'Contact: contact@bikeshop.com',
                  fontSize: 16,
                ),
                SizedBox(height: 20),

                // Copyright & Legal
                customTextWidget(
                  text: 'Legal Information',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                customTextWidget(
                  text: '© 2024 BikeShop Inc. All rights reserved.',
                  fontSize: 16,
                ),
                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    // Navigate to Privacy Policy
                  },
                  child: customTextWidget(
                    text: 'Privacy Policy',
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Terms of Service
                  },
                  child: customTextWidget(
                    text: 'Terms of Service',
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to create circle shapes
  Widget _buildCircleShape(double size, Color color) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  // Method to create diagonal shapes
  Widget _buildDiagonalShape(double width, double height, Color color) {
    return Transform.rotate(
      angle: -0.5, // Adjust this for diagonal rotation
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
