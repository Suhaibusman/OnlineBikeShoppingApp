import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class MapScreenPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: customTextWidget(text: "Map Screen", color: Colors.white , fontWeight: FontWeight.bold , fontSize: 24),

        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          // Diagonal Shape at the top
          Positioned(
            top: 0,
            left: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 150),
              painter: DiagonalShapePainter(),
            ),
          ),

          // Lottie animation for the map
          Center(
            child: Lottie.asset(
              'assets/mapJson.json', // Add your Lottie map animation here
              width: 300,
              height: 300,
            ),
          ),

          // Search Bar at the top of the screen
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search location...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // List of dummy locations at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nearby Locations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        LocationTile(locationName: 'Park Central'),
                        LocationTile(locationName: 'City Square Mall'),
                        LocationTile(locationName: 'Downtown Cafe'),
                        LocationTile(locationName: 'Riverwalk Plaza'),
                      ],
                    ),
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

// Custom ListTile for Dummy Locations
class LocationTile extends StatelessWidget {
  final String locationName;

  const LocationTile({required this.locationName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.location_pin, color: Colors.redAccent),
      title: Text(locationName),
      onTap: () {
        // Add your action on tap, such as opening a location details page
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Tapped on $locationName'),
        ));
      },
    );
  }
}

// Custom painter to create diagonal shapes at the top
class DiagonalShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
