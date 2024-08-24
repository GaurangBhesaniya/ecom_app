import 'package:ecom_app/config/app_image.dart';

class ShoplocalCarousal {
  final String carousalImage;
  final String storeLogo;

  ShoplocalCarousal({required this.storeLogo, required this.carousalImage});
}

List<ShoplocalCarousal> carousalList = [
  ShoplocalCarousal(
      storeLogo: AppImage.sazoLogo, carousalImage: AppImage.carousalImage),
  ShoplocalCarousal(
      storeLogo: AppImage.areltoLogo, carousalImage: AppImage.carousalImage),
  ShoplocalCarousal(
      storeLogo: AppImage.onelessLogo, carousalImage: AppImage.carousalImage),
  // ShoplocalCarousal(
  //     storeLogo: AppImage.oneperyLogo, carousalImage: AppImage.carousalImage),
  // ShoplocalCarousal(
  //     storeLogo: AppImage.jaipuriDoriLogo, carousalImage: AppImage.carousalImage),
  // ShoplocalCarousal(
  //     storeLogo: AppImage.fiveAmLogo, carousalImage: AppImage.carousalImage),
];
