import 'package:oneline_bike_shopping_app/domain/product_model.dart';
import 'package:oneline_bike_shopping_app/utils/constant/image_constant.dart';

List<ProductModel> cartItems= [];
int selectedProductIndex = 0;
// List< ProductModel> favouriteItems = [];
List<ProductModel> favouriteItems = productsData.where((product) => product.isFav).toList();

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
