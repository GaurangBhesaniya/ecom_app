
import 'package:ecom_app/config/app_anime.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lottie/lottie.dart';

import 'order_details.dart';


class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> with SingleTickerProviderStateMixin {


  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 20),
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.1),
                ),
                child: SvgPicture.asset(
                  AppSvg.searchIcon,
                  colorFilter: const ColorFilter.mode(
                      Colors.white, BlendMode.srcIn),
                ),
              ),
            )
          ],
          leading: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              )),
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Gilroy-SemiBold',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: activeOrders(),
          )),
    );
  }

  Column activeOrders() {
    return Column(
      mainAxisAlignment:orderDetails.isNotEmpty?MainAxisAlignment.start:MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (orderDetails.isNotEmpty)
          const SizedBox(
            height:20,
          ),
        if (orderDetails.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: orderDetails.length,
            itemBuilder: (BuildContext context, int index) {
              final reversedIndex = orderDetails.length - index - 1;
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Get.to(()=>OrderDetailsScreen(orderDetail:orderDetails[reversedIndex],));
                },
                child: Container(
                  alignment: FractionalOffset.center,
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.only(left: 20, bottom: 20, right:18),
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border:  GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xffA8FFD0).withOpacity(.5),
                                Colors.transparent
                              ],
                              begin: Alignment.centerLeft,
                              end: FractionalOffset.centerRight,
                              stops: const [0.5, 1.0])),
                      boxShadow: kElevationToShadow[2]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              AppImage.sazoLogo,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'sazo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                    height: 0.01,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'Order # ',
                                            style: TextStyle(
                                              color: Color(0xFFBBBBBB),
                                              fontSize: 14,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '2208240${reversedIndex + 1}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' ',
                                            style: TextStyle(
                                              color: Color(0xFFBBBBBB),
                                              fontSize: 14,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' ',
                                            style: TextStyle(
                                              color: Color(0xFFDDDDDD),
                                              fontSize: 14,
                                              fontFamily: 'Gilroy-Medium',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  '22 August, 2024',
                                  style: TextStyle(
                                    color: Color(0xFFBBBBBB),
                                    fontSize: 12,
                                    fontFamily: 'Gilroy-Medium',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: const Color(0xffA8FFD0).withOpacity(.2),
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: kElevationToShadow[2]),
                            height: 25,
                            child: Text(
                              capitalizeFirstLetter('placed'),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xffA8FFD0),
                                fontSize: 12,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Spacer(),
                           Text(
                            'Rs. ${orderDetails[reversedIndex]['price']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        if (orderDetails.isEmpty)
          Center(
            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
            const Text(
              'No order found!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 24,
                fontFamily: 'Gilroy-SemiBold',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: Get.width - 90,
              child: const Text(
                "Don’t worry! Explore Shop Local & you'll have brand-new orders to track",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF778FBD),
                  fontSize: 17,
                  fontFamily: 'Gilroy-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Lottie.asset(LottieAnime.manualNoOrder,
                height: 150, width: 150, fit: BoxFit.cover),
                          ],
                        ),
          )
      ],
    );
  }
}
