import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  PanelController deleteController = PanelController();
  int activeIndex = 0;
  List storeDetail = [];
  bool isProductFound = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.cartBackGround), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child:emptyCartView()),
        ),
      );
  }

  Stack emptyCartView() {
    return Stack(
      children: [
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Image.asset(
            AppImage.cartBackGround,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: Get.height,
          width: Get.width,
          child: Image.asset(AppImage.cartDesk),
        ),
        Positioned(
            bottom: -25,
            left: -32,
            child: SizedBox(
                height: 255,
                child: Image.asset(
                  AppGif.emptyCart,
                ))),
        Container(
          padding:  EdgeInsets.only(top: (Get.height<=670.0)?120:200),
          height: Get.height,
          width: Get.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your cart is empty!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontFamily: 'Gilroy-SemiBold',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Why don’t you try something \nfrom our shop?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6C82AD),
                  fontSize: 18,
                  fontFamily: 'Gilroy-Regular',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


