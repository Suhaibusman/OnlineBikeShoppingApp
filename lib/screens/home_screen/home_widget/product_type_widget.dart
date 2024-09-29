import 'package:flutter/material.dart';

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
      child: GestureDetector(
        onTap: () {
          print('Tapped on index $index'); // Debugging to track taps
          onTap(index); // Call the parent's onTap to update the selected index
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Conditional gradient based on whether the widget is selected or not
            gradient: selectedProductIndex == index
                ? const LinearGradient(
                    colors: [
                      Color(0xFF34C8E8), // Start color: #34C8E8
                      Color(0xFF4E4AF2), // End color: #4E4AF2
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : const LinearGradient(
                    colors: [
                      Color(
                          0xFF1A1A1A), // Dark gray start color (instead of pure black)
                      Color(0xFF4A4A4A), // Medium dark gray
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
          ),
          child: Image.asset(
            iconPath,
            errorBuilder: (context, error, stackTrace) {
              print(
                  'Error loading image: $error'); // Debugging to track image loading issues
              return Icon(Icons.error, color: Colors.red);
            },
          ),
        ),
      ),
    );
  }
}
