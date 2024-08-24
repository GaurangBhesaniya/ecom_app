import 'package:ecom_app/config/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ecom_app/config/app_anime.dart';
import 'bottom_navigation/app_bottom_navigation.dart';
import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isLogin) {
        Get.off(() => const AppBottomNavigation());
      } else {
        Get.off(() => const OnBoardingScreens());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      height: size.height,
      width: size.width,
      child: Lottie.asset(
        LottieAnime.splashAnimation,
        repeat: true,
        reverse: false,
      ),
    ));
  }
}
