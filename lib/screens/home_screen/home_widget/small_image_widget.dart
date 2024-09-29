import 'package:flutter/material.dart';
import 'package:oneline_bike_shopping_app/data/data.dart';
import 'package:oneline_bike_shopping_app/domain/product_model.dart';
import 'package:oneline_bike_shopping_app/screens/home_screen/home_widget/product_details_screen.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';
import 'package:oneline_bike_shopping_app/utils/widget/text_widget.dart';

class SmallImageWidget extends StatefulWidget {
  final ProductModel productData;
  final VoidCallback onFavouriteChanged;

  const SmallImageWidget(
      {super.key,
      required this.productData,
      required this.onFavouriteChanged
      });

  @override
  State<SmallImageWidget> createState() => _SmallImageWidgetState();
}

class _SmallImageWidgetState extends State<SmallImageWidget> {

  @override
  Widget build(BuildContext context) {
    bool isFav = favouriteItems.contains(widget.productData);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productData: widget.productData,
            ),
          ),
        );
      },
      child: Container(
        height: 213,
        width: 165,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.smallImageBackground),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (isFav) {
                      // Remove from favorite list
                      favouriteItems.remove(widget.productData);
                      widget.productData.isFav = false; // Update model
                    } else {
                      // Add to favorite list
                      favouriteItems.add(widget.productData);
                      widget.productData.isFav = true; // Update model
                    }
                    widget.onFavouriteChanged();
                  });





                },
                icon:  Icon(
                  isFav ==true ?Icons.favorite : Icons.favorite_border,
                  color: isFav ==true ? Colors.red:  Colors.white,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                widget.productData.productImage,
                height: 70,
                width: 100, // And also the width
                // fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextWidget(
                    text: widget.productData.productName,
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  customTextWidget(
                    text: widget.productData.productDetails,
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                  customTextWidget(
                    text: "\$ ${widget.productData.productPrice}",
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
