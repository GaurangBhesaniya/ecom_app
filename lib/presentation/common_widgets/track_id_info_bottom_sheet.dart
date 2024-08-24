import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/presentation/common_widgets/sliding_panel_grey_container.dart';


class TrackIdInfoBottomSheet extends StatefulWidget {
  final Size size;

  const TrackIdInfoBottomSheet({super.key, required this.size});

  @override
  State<TrackIdInfoBottomSheet> createState() => _TrackIdInfoBottomSheetState();
}

class _TrackIdInfoBottomSheetState extends State<TrackIdInfoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX:5, sigmaY:5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.51,
              decoration: BoxDecoration(
                color: const Color(0xff111111).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height * 0.51,
          decoration:  const BoxDecoration(
            border: GradientBoxBorder(
                gradient: LinearGradient(
                    colors: [AppColors.primary, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                width:.8),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlidingPanelGreyContainer(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: Get.width / 2,
                child: const Text(
                  'Where do I find tracking ID?',
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: 26,
                    fontFamily: 'Gilroy-SemiBold',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Tracking IDs are shared by the courier partners responsible to deliver your order.",
                style: TextStyle(
                  color: Color(0xFFFAFAFA),
                  fontSize: 16,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                          text: "A tracking ID is also be referred as ",
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 16,
                            fontFamily: 'Gilroy-Medium',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          )
                        ),
                        TextSpan(
                          text: 'AWS Number',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontFamily: 'Gilroy-SemiBold',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ' or ',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 16,
                            fontFamily: 'Gilroy-Medium',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Order ID',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontFamily: 'Gilroy-SemiBold',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ' depending on the courier partner.\n\nYou often receive a tracking ID on your registered number/email address used during checkout/booking courier.\n',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 16,
                            fontFamily: 'Gilroy-Medium',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ]
                  )
              )
            ],
          ),
        ),
      ],
    );
  }
}
