import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oneline_bike_shopping_app/data/data.dart';
import 'package:oneline_bike_shopping_app/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/small_image_widget.dart';
import 'package:oneline_bike_shopping_app/utils/themes/color_themes.dart';
import 'package:oneline_bike_shopping_app/utils/widget/blue_button_widget.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("fav item : $favouriteItems");
    double mediaHeight = MediaQuery.of(context).size.height;
    double mediaWidth = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            // Background Image with custom width and height
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                "assets/bluebackground.png",
                // height: MediaQuery.of(context).size.height -100,  // Specify the height you want
                // width: double.infinity-20,  // Set width to cover full screen
                fit: BoxFit.cover, // Adjust the image fitting as needed
              ),
            ),
            // Main content above the background
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: favouriteItems.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Lottie.asset('assets/nofavjson.json',
                                height: mediaHeight - 400,
                                width: mediaWidth - 100),
                            customTextWidget(
                              text: "No Favourite Found",
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: favouriteItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 items per row
                            crossAxisSpacing: 10, // spacing between columns
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 0.5,
                          ),
                          itemBuilder: (context, index) => SmallImageWidget(
                            productData: favouriteItems[index],
                            onFavouriteChanged: () {
                              setState(() {});
                            },
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              bottom:
                  20, // Adjust this value as needed to position the button vertically
              left: 0,
              right: 0, // These ensure the button is horizontally centered
              child: Center(
                child: customBlueButtonWidget(
                  text: "Back to Home",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(),
                      ),
                    );
                  },
                  fontColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
