import 'package:ecom_app/config/app_image.dart';

class ShoplocalSelectedProduct {
  final String productImage;
  final String productTitle;
  final String productPrice;
  final String storeName;

  ShoplocalSelectedProduct(
      {required this.productImage,
      required this.productPrice,
      required this.productTitle,
      required this.storeName});
}

List<ShoplocalSelectedProduct> justForYouProduct = [
  ShoplocalSelectedProduct(
      productImage: AppImage.productOne,
      productPrice: "2,999",
      productTitle: "OUT OF SERVICE CO-ORD SET - FULL SET",
      storeName: "Sazo"),
  ShoplocalSelectedProduct(
      productImage: AppImage.productOne,
      productPrice: "2,999",
      productTitle: "OUT OF SERVICE CO-ORD SET - FULL SET",
      storeName: "Sazo"),
  ShoplocalSelectedProduct(
      productImage: AppImage.productOne,
      productPrice: "2,999",
      productTitle: "OUT OF SERVICE CO-ORD SET - FULL SET",
      storeName: "Sazo"),
  ShoplocalSelectedProduct(
      productImage: AppImage.productOne,
      productPrice: "2,999",
      productTitle: "OUT OF SERVICE CO-ORD SET - FULL SET",
      storeName: "Sazo"),
  ShoplocalSelectedProduct(
      productImage: AppImage.productOne,
      productPrice: "2,999",
      productTitle: "OUT OF SERVICE CO-ORD SET - FULL SET",
      storeName: "Sazo"),

];
