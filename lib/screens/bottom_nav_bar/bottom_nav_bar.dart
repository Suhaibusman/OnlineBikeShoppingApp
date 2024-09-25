import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_screen.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    const Center(child: Text('Map Page')),
    const Center(child: Text('Cart Page')),
    const Center(child: Text('Profile Page')),
    const Center(child: Text('Orders Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        children: [
          // Custom background with curve
          Container(
            height: 80,
            color: primaryColor,

            // decoration: BoxDecoration(
            //   image: const DecorationImage(
            //     image: AssetImage("assets/navBarRectangle.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ), // Background color of the navbar
          ),
          // Positioned icons
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavBarItem(Icons.directions_bike, 0),
                  _buildNavBarItem(Icons.map, 1),
                  _buildNavBarItem(Icons.shopping_cart, 2),
                  // _buildCenterNavBarItem(Icons.shopping_cart),
                  _buildNavBarItem(Icons.person, 3),
                  _buildNavBarItem(Icons.receipt, 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Apply transform to move the selected item outside the navbar
          isSelected
              ? Transform.translate(
            offset: const Offset(0, -30), // Move the selected item up by 20
            child: Container(
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/navbarBox.png"),
                ),
              ),
              child: Icon(
                icon,
                size: 30,
                color: Colors.white, // Highlight selected icon color
              ),
            ),
          )
              : Icon(
            icon,
            size: 30,
            color: Colors.white, // Unselected icon color
          ),
        ],
      ),
    );
  }


}

// CustomClipper to create the curved background of the navbar
class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height - 50,
        size.width * 0.4, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 50, size.width * 0.6, size.height);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
