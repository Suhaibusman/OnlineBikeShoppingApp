import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';

class ProductTypeWidget extends StatelessWidget {
  final int index;
  final String iconPath;
  final double leftPosition;
  final double bottomPosition;
  final int selectedProductIndex;
  final Function(int) onTap;

  const ProductTypeWidget({
    super.key,
    required this.index,
    required this.iconPath,
    required this.leftPosition,
    required this.bottomPosition,
    required this.selectedProductIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottomPosition,
      left: leftPosition,
      child: InkWell(
        onTap: () {
          print('Tapped on index $index'); // Debugging to track taps
          onTap(index); // Call the parent's onTap to update the selected index
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: selectedProductIndex == index ? primaryColor : lightBlueColor, // Change color based on index
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            iconPath,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error'); // Debugging to track image loading issues
              return Icon(Icons.error, color: Colors.red);
            },
          ),
        ),
      ),
    );
  }
}
