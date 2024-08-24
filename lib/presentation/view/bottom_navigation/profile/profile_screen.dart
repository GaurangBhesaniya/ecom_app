import 'dart:ui';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/controllers/auth_controller.dart';
import 'package:ecom_app/presentation/common_widgets/profile_card.dart';
import 'package:ecom_app/presentation/view/introductory/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_app/config/app_image.dart';
import '../favorite/favourites_screen.dart';
import 'myorder/my_order_view.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'ShopLocalScreen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff0F1120),
        Color(0xff0B0C15),
        Color(0xff090B14),
      ], begin: Alignment.topCenter, end: AlignmentDirectional.bottomEnd)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff0F1120),
            Color(0xff0B0C15),
            Color(0xff090B14),
          ], begin: Alignment.topCenter, end: AlignmentDirectional.bottomEnd)),
          child: userProfileView(),
        ),
      ),
    );
  }

  SingleChildScrollView userProfileView() {
    return SingleChildScrollView(
      physics: (Get.height <= 670.0)
          ? const ClampingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, Get.height / 2, 20, 0),
            color: Colors.transparent,
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                ProfileCard(
                  onTap: () {},
                  title: 'Email Accounts (1)',
                  icon: AppImage.profileMail,
                ),
                ProfileCard(
                  onTap: () {},
                  title: 'Manage Addresses',
                  icon: AppImage.profileTruck,
                ),
                ProfileCard(
                  onTap: () {},
                  title: 'Support',
                  icon: AppImage.profileSupport,
                ),
                ProfileCard(
                  onTap: ()async{
                    pref!.setBool('isLogin',false);
                    pref!.setString('UserName','');
                    pref!.setString('UserEmail','');
                    pref!.setString('UserProfile','');
                    isLogin=pref!.getBool('isLogin')!;
                    userName=pref!.getString('UserName')!;
                    userEmail=pref!.getString('UserEmail')!;
                    userProfile=pref!.getString('UserProfile')!;
                    selectedIndex=0;
                    await authController.signOut();
                    Get.offAll(()=>const SplashScreen());
                  },
                  title: 'Sign Out',
                  icon: AppImage.settingLogout,
                ),
              ],
            ),
          ),
          Material(
            type: MaterialType.transparency,
            borderRadius: BorderRadius.circular(25),
            color: Colors.transparent,
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(top: (Get.height <= 670) ? 50 : 75),
              alignment: Alignment.topCenter,
              height: Get.height / 2.5,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(colors: [
                  Color(0xff0B0C15),
                  Color(0xff141C2D),
                  Color(0xff162137),
                  Color(0xff10162C),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        image:  DecorationImage(
                            image: NetworkImage(userProfile),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                   Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Gilroy-SemiBold',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.52,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(
                    userEmail,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF889BC1),
                      fontSize: 16,
                      fontFamily: 'Gilroy-Medium',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(45, Get.height / 2.8, 45, 0),
            child: Container(
              height: 70,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 70,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xff162137),
                              Color(0xff10162C),
                              Color(0xff0B0C15),
                              Color(0xff090B14),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 0.75, 1.0])),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        height: 70,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 70,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          color: const Color(0xCC6297FF),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: ()  {
                            Get.to(() => const MyOrderView());
                          },
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(
                                  AppImage.profileBox,
                                ),
                                color: Color(0xff3D7EFF),
                              ),
                              Text(
                                'My Orders',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                  letterSpacing: 0.10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        SizedBox(
                          height: Get.height,
                          child: const VerticalDivider(
                            color: Color(0x7F6297FF),
                            thickness: 2,
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.to(() => const FavouritesScreen());
                          },
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(
                                  AppImage.profileFav,
                                ),
                                color: Color(0xff3D7EFF),
                              ),
                              Text(
                                'Favourites',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                  letterSpacing: 0.10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
