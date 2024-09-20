import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

Widget customButtonWidget({
  required String text,
  required Function() onPressed,
  required Color fontColor,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        height: 43,
        width: 129,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.bottomSheetButton),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
            child: customTextWidget(
          text: text,
          fontSize: 15,
          fontWeight: fontWeight,
          color: fontColor,
        ))),
  );
}
