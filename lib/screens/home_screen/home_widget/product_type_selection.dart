import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/product_type_widget.dart';

import '../../../utils/constant/image_constant.dart';

class ProductTypeSelection extends StatefulWidget {
  const ProductTypeSelection({super.key});

  @override
  State<ProductTypeSelection> createState() => _ProductTypeSelectionState();
}

class _ProductTypeSelectionState extends State<ProductTypeSelection> {
  int selectedProductIndex = 0; // Move the state here

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 90),
      child: Container(
        color: Colors.red,
        height: 0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            clipBehavior: Clip.none, // Allows for overflow to be visible
            children: [
              ProductTypeWidget(
                index: 0,
                iconPath: ImageConstant.allIcon,
                leftPosition: 0,
                bottomPosition: 60,
                selectedProductIndex:
                    selectedProductIndex, // Pass the selected index
                onTap: (index) {
                  setState(() {
                    selectedProductIndex = index; // Update the selected index
                  });
                },
              ),
              ProductTypeWidget(
                index: 1,
                iconPath: ImageConstant.batteryIcon,
                leftPosition: 70,
                bottomPosition: 70,
                selectedProductIndex: selectedProductIndex,
                onTap: (index) {
                  setState(() {
                    selectedProductIndex = index;
                  });
                },
              ),
              ProductTypeWidget(
                index: 2,
                iconPath: ImageConstant.roadIcon,
                leftPosition: 140,
                bottomPosition: 80,
                selectedProductIndex: selectedProductIndex,
                onTap: (index) {
                  setState(() {
                    selectedProductIndex = index;
                  });
                },
              ),
              ProductTypeWidget(
                index: 3,
                iconPath: ImageConstant.unionIcon,
                leftPosition: 210,
                bottomPosition: 90,
                selectedProductIndex: selectedProductIndex,
                onTap: (index) {
                  setState(() {
                    selectedProductIndex = index;
                  });
                },
              ),
              ProductTypeWidget(
                index: 4,
                iconPath: ImageConstant.helmetIcon,
                leftPosition: 280,
                bottomPosition: 100,
                selectedProductIndex: selectedProductIndex,
                onTap: (index) {
                  setState(() {
                    selectedProductIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
