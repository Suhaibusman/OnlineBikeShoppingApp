import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class TopImageWidget extends StatelessWidget {
  const TopImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Image.asset(ImageConstant.imageBackground),
          Positioned(
            top: 0,
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.cycleImage1,
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                      ),
                      child: customTextWidget(
                          text: "30% off",
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
