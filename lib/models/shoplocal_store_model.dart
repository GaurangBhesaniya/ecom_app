import 'package:ecom_app/config/app_image.dart';

class ShoplocalStoreModel{
  final String storeLogo;
  final String storeName;
  ShoplocalStoreModel({required this.storeName,required this.storeLogo});
}

List<ShoplocalStoreModel> storeList=[
  ShoplocalStoreModel(storeName: "Sazo", storeLogo: AppImage.sazoLogo),
  ShoplocalStoreModel(storeName: "Onepery", storeLogo: AppImage.oneperyLogo),
  ShoplocalStoreModel(storeName: "Oneless", storeLogo: AppImage.onelessLogo),
  ShoplocalStoreModel(storeName: "JaipuriDori", storeLogo: AppImage.jaipuriDoriLogo),
  ShoplocalStoreModel(storeName: "5 am", storeLogo: AppImage.fiveAmLogo),
  ShoplocalStoreModel(storeName: "Arelto", storeLogo: AppImage.areltoLogo),
];
