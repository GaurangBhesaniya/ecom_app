import 'package:ecom_app/config/app_anime.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {




  TextEditingController searchData = TextEditingController();
  bool isSearch = false;
  List searchFavProduct = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          isSearch = false;
          setState(() {});
        },
        child: Container(
          height: Get.height,
          width: Get.width,
          color: AppColors.backgroundColor,
          child: noFavPortion(),
        ),
      ),
    );
  }

  Container noFavPortion() {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.favBack), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AppImage.favPart,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 35,
              left: 55,
              child: Lottie.asset(LottieAnime.favStar,
                  height: 120, width: 120, fit: BoxFit.cover)),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 22, vertical: (Get.height <= 670.0)?45:70),
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .11,
                ),
                const Text(
                  'No favourites yet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 24,
                    fontFamily: 'Gilroy-SemiBold',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height:10,
                ),
                SizedBox(
                  width: Get.width - 90,
                  child: const Text(
                    'It looks like your favourites list is feeling a bit dry. Add some now!',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(0xFF6C82AD),
                      fontSize: 18,
                      fontFamily: 'Gilroy-Regular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height:70,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    selectedIndex = 0;
                    Get.offAll(()=>const AppBottomNavigation());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width * .6,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 2, color: AppColors.primary),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Go to shop local',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
