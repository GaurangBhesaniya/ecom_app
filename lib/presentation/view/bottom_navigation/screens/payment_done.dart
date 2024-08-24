import 'dart:convert';

import 'package:ecom_app/config/app_anime.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/models/order_model.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/app_bottom_navigation.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/screens/payment_processing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentProcessingDialog extends StatefulWidget {
  const PaymentProcessingDialog({super.key});

  @override
  State<PaymentProcessingDialog> createState() =>
      _PaymentProcessingDialogState();
}

class _PaymentProcessingDialogState extends State<PaymentProcessingDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: const Material(child: PaymentProcessingView()));
  }
}

class PaymentDoneScreen extends StatefulWidget {
  final String size;
  final String price;
  final String qty;

  const PaymentDoneScreen(
      {super.key, required this.size, required this.price, required this.qty});

  @override
  State<PaymentDoneScreen> createState() => _PaymentDoneScreenState();
}

class _PaymentDoneScreenState extends State<PaymentDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: SvgPicture.asset(AppSvg.paymentProcessingBack),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 100),
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height / 4,
                  ),
                  const Text(
                    'Order Placed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6297FF),
                      fontSize: 24,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    '"Hooray! Your order is on the move.\nReady for more? Continue shopping!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6C82AD),
                      fontSize: 20,
                      fontFamily: 'Gilroy-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      orderDetails =
                          jsonDecode(pref!.getString("orderDetails") ?? "[]");

                      orderDetails.add({
                        'title': 'OUT OF SERVICE CO-ORD SET - FULL SET',
                        'shippingAddress':
                            "20, Anand Nagar, Near Purvi Soc, Hirabaug, Varachha Road, Surat.",
                        "price": widget.price,
                        "size": widget.size,
                        "qty": widget.qty,
                        "image": AppImage.productOne,
                      });
                      await pref!
                          .setString("orderDetails", jsonEncode(orderDetails));
                      orderDetails.clear();
                      orderDetails =
                          jsonDecode(pref!.getString("orderDetails")!) ?? [];

                      selectedIndex = 0;
                      Get.offAll(() => const AppBottomNavigation());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: Get.width - 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: AppColors.primary, width: 2)),
                      child: const Text(
                        'Continue Shopping',
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
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height / 2.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 135,
                    width: 135,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: kElevationToShadow[24],
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xff3D7EFF).withOpacity(0.2),
                              const Color(0xff18243C).withOpacity(0.2),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height / 2.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 220,
                    width: 220,
                    child: Lottie.asset(
                      LottieAnime.paymentDone,
                      fit: BoxFit.cover,
                      repeat: false,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
