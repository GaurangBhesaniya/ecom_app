import 'dart:ui';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/controllers/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecom_app/config/app_anime.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/presentation/common_widgets/signup_with_media.dart';
import 'package:ecom_app/presentation/common_widgets/sliding_panel_grey_container.dart';
import 'login_waiting_screen.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final AuthController authController = Get.put(AuthController());
  final PageController _controller = PageController();
  final PanelController panelController = PanelController();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  bool isVisible = false;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("deviceSize=${MediaQuery.of(context).size.height}");
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                physics: const ClampingScrollPhysics(),
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImage.mapOne))),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(28, 0, 28, 160),
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black12,
                                Colors.black26,
                                Colors.black38,
                                Colors.black54,
                                Colors.black87,
                                Colors.black.withOpacity(0.9),
                                Colors.black,
                                Colors.black,
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Locate Orders with Ease",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Quick and effortless order tracking under one roof for all your orders",
                                style: TextStyle(
                                  color: Color(0xFF889BC1),
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 6,
                          right: 7,
                          child: Lottie.asset(
                            frameRate: FrameRate.max,
                            LottieAnime.onLineOne,
                            repeat: false,
                            reverse: false,
                          ),
                        ),
                        Positioned(
                            top: 165,
                            right: 135,
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xff7181D7))),
                            )),
                        Positioned(
                          top: 20,
                          right: -10,
                          child: SizedBox(
                            width: Get.width,
                            child: Lottie.asset(
                              frameRate: FrameRate.max,
                              LottieAnime.locationOn,
                              repeat: true,
                              reverse: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImage.mapTwo))),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(28, 0, 28, 160),
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black12,
                                Colors.black26,
                                Colors.black38,
                                Colors.black54,
                                Colors.black87,
                                Colors.black.withOpacity(0.9),
                                Colors.black,
                                Colors.black,
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Shop New, Shop Local",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Shop from your To-Be-Favourite brands with our very own Shop Local",
                                style: TextStyle(
                                  color: Color(0xFF889BC1),
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 5,
                          child: Lottie.asset(
                            frameRate: FrameRate.max,
                            LottieAnime.onLineTwo,
                            repeat: false,
                            reverse: false,
                          ),
                        ),
                        SizedBox(
                          height: Get.height,
                          width: Get.width,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 90,
                                  left: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 2, sigmaY: 2),
                                      child: Image.asset(
                                        AppImage.onSazoLocation,
                                        height: 91,
                                        width: 91,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: 265,
                                  right: 25,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 2, sigmaY: 2),
                                      child: Image.asset(
                                        AppImage.onWholeLocation,
                                        height: 65,
                                        width: 65,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: 420,
                                  left: 55,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 0.5,
                                        sigmaY: 0.5,
                                      ),
                                      child: Image.asset(
                                        AppImage.onOneLessLocation,
                                        height: 64,
                                        width: 64,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImage.mapTwo))),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 160),
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black12,
                                Colors.black26,
                                Colors.black38,
                                Colors.black54,
                                Colors.black87,
                                Colors.black.withOpacity(0.9),
                                Colors.black,
                                Colors.black,
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Your data is secure",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                width: Get.width,
                                child: const Text(
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  "Don’t worry! We value your privacy and data. You are safe with Trac91",
                                  style: TextStyle(
                                    color: Color(0xFF889BC1),
                                    fontSize: 16,
                                    fontFamily: 'Gilroy-Medium',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 10,
                          child: Lottie.asset(
                            frameRate: FrameRate.max,
                            LottieAnime.onLineThree,
                            repeat: false,
                            reverse: false,
                          ),
                        ),
                        Positioned(
                          top: -25,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 30),
                            alignment: Alignment.bottomCenter,
                            height: Get.height / 2,
                            width: Get.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  alignment: Alignment.center,
                                  height: 153,
                                  width: 153,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              AppImage.onLockBackground))),
                                  child: Lottie.asset(
                                    height: 80,
                                    width: 80,
                                    frameRate: FrameRate.max,
                                    LottieAnime.lock,
                                    repeat: true,
                                    reverse: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              IgnorePointer(
                child: AnimatedOpacity(
                    opacity: isShow ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 60, right: 25, left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: const ExpandingDotsEffect(
                              activeDotColor: Color(0xff3D7EFF),
                              dotColor: Color(0xffEBEBF5),
                              dotHeight: 5,
                              dotWidth: 5,
                              expansionFactor: 5)),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          isLoading.value = false;
                          isShow = true;
                          panelController.open();
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xff3D7EFF),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 1,
                                style: BorderStyle.solid,
                              )),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SlidingUpPanel(
                controller: panelController,
                color: Colors.transparent,
                minHeight: 0,
                maxHeight:
                    (Get.height <= 670.0) ? Get.height / 1.4 : Get.height / 2,
                body: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, top: 50, left: 5),
                    child: isLoading.value
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  color: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      isLoading.value = true;
                                      isShow = false;
                                      panelController.close();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                    size: 18,
                                  )),
                              // InkWell(
                              //   splashColor: Colors.transparent,
                              //   highlightColor: Colors.transparent,
                              //   onTap: () async {
                              //     Get.off(() => const AppBottomNavigation());
                              //   },
                              //   child: const Text(
                              //     "Skip",
                              //     style: TextStyle(
                              //       color: Color(0xFF3D7EFF),
                              //       fontSize: 20,
                              //       fontFamily: 'Gilroy-SemiBold',
                              //       fontWeight: FontWeight.w400,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                  ),
                ),
                panel: Container(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 65),
                  decoration: const BoxDecoration(
                      color: Color(0xff0E111E),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      gradient: LinearGradient(
                          colors: [Color(0xff0E111E), Color(0xff0B0D15)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          panelController.close();
                        },
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SlidingPanelGreyContainer(),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: const Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          "Connect your email account to experience the new age shopping and automated order tracking.",
                          style: TextStyle(
                            color: Color(0xFF889BC1),
                            fontSize: 16,
                            fontFamily: 'Gilroy-Medium',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      SignupWithGoogle(
                        onTap: () async {
                          await authController.signInWithGoogle();

                          debugPrint("UserName:$userName");
                          debugPrint("UserEmail:$userEmail");
                          debugPrint("UserProfile:$userProfile");

                          Get.off(()=> LoginWaitingScreen(userName: authController.user.value!.displayName.toString(), userEmail: authController.user.value!.email.toString(), userPhnNumber: '', userProfile: authController.user.value!.photoURL.toString(),));
                          // Get.off(()=>const AppBottomNavigation());
                        },
                      ),
                      const Spacer(),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text:
                                  'By proceeding to use Trac91, you agree to our ',
                              style: TextStyle(
                                color: Color(0xFF889BC1),
                                fontSize: 14,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                                text: 'terms of service',
                                style: const TextStyle(
                                  color: Color(0xFF3D7EFF),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                            const TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: Color(0xFF889BC1),
                                fontSize: 14,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                                text: 'privacy policy',
                                style: const TextStyle(
                                  color: Color(0xFF3D7EFF),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                            const TextSpan(
                              text: '.',
                              style: TextStyle(
                                color: Color(0xFF889BC1),
                                fontSize: 14,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onPanelClosed: () {
                  setState(() {
                    isLoading.value = true;
                    isShow = false;
                    isVisible = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//FontWeight.w100 is Ultra Light
// FontWeight.w200 is Thin
// FontWeight.w300 is Light
// FontWeight.w400 is Regular
// FontWeight.w500 is Medium
// FontWeight.w600 is Semi Bold
// FontWeight.w700 is Bold
// FontWeight.w800 is Heavy
// FontWeight.w900 is Black
