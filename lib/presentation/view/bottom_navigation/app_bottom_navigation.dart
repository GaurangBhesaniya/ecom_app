import 'package:ecom_app/presentation/view/bottom_navigation/favorite/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/cart/cart_screen.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/shoplocal/new_shop_local.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/profile/profile_screen.dart';


class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  static List<Widget> pages = <Widget>[
    const NewShopLocalScreen(),
    const CartScreen(),
    const FavouritesScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height / 9,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF333476), Color(0xFF0F0F1D)],
                ),
              ),
            ),
            Container(
              height: Get.height / 9, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildBottomNavBarItem(0, AppSvg.bottomBag),
                    buildBottomNavBarItem(1, AppSvg.bottomCart),
                    buildBottomNavBarItem(2, AppSvg.bottomCube),
                    buildBottomNavBarItem(3, AppSvg.bottomProfile),
                  ],
                ),
              ),
            )
          ],
        ),
        backgroundColor:
            (selectedIndex == 0) ? Colors.transparent : Colors.transparent,
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
    );
  }

  Widget buildBottomNavBarItem(
    int index,
    String iconPath,
  ) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            (selectedIndex == index)
                ? BoxShadow(
                    color: AppColors.primary.withAlpha(150),
                    spreadRadius: -15,
                    blurRadius: 20,
                  )
                : const BoxShadow(color: Colors.transparent),
          ],
        ),
        child: (index != 2)
            ? (index != 3)
                ? SvgPicture.asset(
                    height: 45,
                    iconPath,
                    color: (selectedIndex == index)
                        ? AppColors.primary
                        : Colors.white,
                  )
                : Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: (selectedIndex == index)
                                ? AppColors.primary
                                : Colors.white,
                            width:.5),
                        image:  DecorationImage(
                            image: NetworkImage(userProfile),
                            fit: BoxFit.contain)),
                  )
            : Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    height: 45,
                    iconPath,
                    color: (selectedIndex == index)
                        ? AppColors.primary
                        : Colors.white,
                  ),
                ],
              ),
      ),
    );
  }
}
