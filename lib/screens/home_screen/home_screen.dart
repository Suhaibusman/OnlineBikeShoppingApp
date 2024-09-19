import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/small_image_widget.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/top_image_widget.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List productImages = [
  ImageConstant.cycleImage1,
  ImageConstant.cycleImage2,
  ImageConstant.cycleImage3,
  ImageConstant.helmetImage
];
List productPrice = ["\$ 1,999.99", "\$ 1,299.99", "\$ 1,899.99", "\$ 1,20"];
List productName = [
  "PEUGEOT - LR01 ",
  "PEUGEOT - LR02 ",
  "PEUGEOT - LR03 ",
  "SMITH - Trade ",
];
List productTitle = [
  "Road Bike",
  "Road Bike",
  "Road Bike",
  "Road Helmet",
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
              bottom: 0, child: Image.asset(ImageConstant.blueBackgroundImage)),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: "Choose Your Bike",
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: lightBlueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const TopImageWidget(),
                // const SmallImageWidget(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 800,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // 2 items per row
                                crossAxisSpacing: 10, // spacing between columns
                                // mainAxisSpacing: 10, // spacing between rows
                                childAspectRatio: 0.7,
                                mainAxisSpacing: 0.5),
                        itemBuilder: (context, index) => SmallImageWidget(
                            productTitle: productTitle[index],
                            productPrice: productPrice[index],
                            productImage: productImages[index],
                            productName: productName[index])),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
