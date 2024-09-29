import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/data/data.dart';
import 'package:oneline_bike_shopping_app/screens/favourite_screen/favourite_screen.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/product_type_selection.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/small_image_widget.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/top_image_widget.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}




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
                          onPressed: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen(),));
                          },


                          icon: const Icon(
                            Icons.favorite,
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
                      onFavouriteChanged: (){
                        setState(() {

                        });
                      },
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
