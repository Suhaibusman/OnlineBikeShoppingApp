import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

Widget customBlueButtonWidget({
  required String text,
  required Function() onPressed,
  required Color fontColor,
  double buttonHeight = 44,
  double buttonWidth = 160,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: const BoxDecoration(
             color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                 Color(0xff34C8E8),
                 Color(0xff4E4AF2),
                // Colors.black.withOpacity(0.6),
                // Colors.white.withOpacity(0.6)

              ],
            )),
        child: Center(
            child: customTextWidget(
          text: text,
          fontSize: 15,
          fontWeight: fontWeight,
          color: fontColor,
        ))),
  );
}
