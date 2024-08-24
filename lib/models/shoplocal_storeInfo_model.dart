import 'package:flutter/material.dart';
import 'package:ecom_app/config/app_image.dart';

class ShoplocalStoreInfoModel {
  final List<String> productImages;
  final String storeLogo;
  final String storeName;
  final String storeTagLine;
  final Color storeColor;

  ShoplocalStoreInfoModel(
      {required this.productImages,
      required this.storeName,
      required this.storeLogo,
      required this.storeTagLine,
      required this.storeColor});
}

List<ShoplocalStoreInfoModel> storeInfoList = [
  ShoplocalStoreInfoModel(
      productImages: [
        AppImage.productOne,
        AppImage.productTwo,
        AppImage.productThree
      ],
      storeName: "Sazo",
      storeLogo: AppImage.sazoLogo,
      storeTagLine:
          "A fun-filled world of the bizarre, in our merch you’ll be star",
      storeColor: const Color(0xff8B8DFF)),
  ShoplocalStoreInfoModel(
      productImages: [AppImage.fiveOne, AppImage.fiveTwo, AppImage.fiveThree],
      storeName: "5 AM",
      storeLogo: AppImage.fiveAmLogo,
      storeTagLine: "Sports, Swim, Walk, Groove #YourGameOurGear",
      storeColor: const Color(0xff629AA0)),
];
