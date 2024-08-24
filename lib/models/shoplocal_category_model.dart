import 'package:ecom_app/config/app_image.dart';

class ShoplocalCategory {
  final String categoryImage;
  final String categoryName;

  ShoplocalCategory({required this.categoryImage, required this.categoryName});
}

List<ShoplocalCategory> categoryList = [
  ShoplocalCategory(
      categoryImage: AppImage.categoryOne, categoryName: "Sustainable Life"),
  ShoplocalCategory(
      categoryImage: AppImage.categoryTwo,
      categoryName: "Street & Active Wear"),
  ShoplocalCategory(
      categoryImage: AppImage.categoryThree, categoryName: "Women Owned"),
];
