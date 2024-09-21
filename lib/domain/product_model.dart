class ProductModel {
  final String productName;
  final num productPrice;
  final String productDetails;
  final String productImage;
  final String productDescription;
  bool isFav = false;
   int quantity;
  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productDetails,
    required this.productImage,
    required this.productDescription,
    required this.quantity,
  });

  // Factory constructor to create a Product object from JSON (Map)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productDetails: json['productDetails'],
      productImage: json['productImage'],
      productDescription: json['productDescription'],
      quantity: json["quantity"],
    );
  }

  // Method to convert a Product object to JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productDetails': productDetails,
      'productImage': productImage,
      'productDescription': productDescription,
      'quantity': quantity,
    };
  }
}
