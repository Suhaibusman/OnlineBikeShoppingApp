import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/domain/product_model.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/product_type_selection.dart';
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


List<ProductModel> productsData = [
  ProductModel(
      productName: "PEUGEOT - LR01",
      productPrice: 1999.99,
      productDetails: "Road Bike",
      productImage: ImageConstant.cycleImage1,
      productDescription: "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain."
      , quantity: 1,
  ),
  ProductModel(
      productName: "PEUGEOT - LR02",
      productPrice: 1299.99,
      productDetails: "Road Bike",
      productImage: ImageConstant.cycleImage2,
      productDescription: "The LR02 is the perfect companion for urban explorers. Its lightweight aluminum frame, smooth-rolling wheels, and reliable Shimano Sora 18-speed drivetrain offer great performance for both daily commuting and weekend adventures."
    , quantity: 1,
  ),
  ProductModel(
      productName: "PEUGEOT - LR03",
      productPrice: 1899.99,
      productDetails: "Road Bike",
      productImage: ImageConstant.cycleImage3,
      productDescription: "Designed for those who crave speed and efficiency, the LR03 is a high-performance road bike built for endurance rides. It boasts a carbon fiber frame, Shimano Ultegra 22-speed drivetrain, and race-ready geometry."
    , quantity: 1,
  ),
  ProductModel(
      productName: "SMITH - Trade",
      productPrice: 120,
      productDetails: "Road Helmet",
      productImage: ImageConstant.helmetImage,
      productDescription: "The SMITH Trade helmet offers unparalleled protection with advanced aerodynamics and a lightweight design. Perfect for road cyclists looking for safety and performance, it features MIPS technology and a highly adjustable fit system."
    , quantity: 1,
  )
];



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          // Background Image with custom width and height
          Positioned(


            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/bluebackground.png",
              height: MediaQuery.of(context).size.height -100,  // Specify the height you want
              width: double.infinity-20,  // Set width to cover full screen
              fit: BoxFit.cover,  // Adjust the image fitting as needed
            ),
          ),
          // Main content above the background
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20 , bottom: 20),
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
                const ProductTypeSelection(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsData.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 items per row
                      crossAxisSpacing: 10, // spacing between columns
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 0.5,
                    ),
                    itemBuilder: (context, index) => SmallImageWidget(
                      productData: productsData[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
