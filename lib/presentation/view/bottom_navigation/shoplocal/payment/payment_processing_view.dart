import 'package:ecom_app/config/app_anime.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class PaymentProcessingView extends StatefulWidget {
  const PaymentProcessingView({super.key});

  @override
  State<PaymentProcessingView> createState() => _PaymentProcessingViewState();
}

class _PaymentProcessingViewState extends State<PaymentProcessingView> {
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
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height/4,),
                  const Text(
                    'Processing your Payment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 24,
                      fontFamily: 'Gilroy-SemiBold',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height:8,),
                  const Text(
                    'Hold on, no backing out now! \nJust a few seconds more..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6C82AD),
                      fontSize: 20,
                      fontFamily: 'Gilroy-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0,
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
              padding: EdgeInsets.only(top: Get.height / 1.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 170,
                    width: 170,
                    child: Lottie.asset(LottieAnime.paymentProcessing,
                        fit: BoxFit.cover, repeat: true,),
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
