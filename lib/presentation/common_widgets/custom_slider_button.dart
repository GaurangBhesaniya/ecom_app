
import 'dart:ui';

import 'package:ecom_app/config/app_anime.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slidable_button/slidable_button.dart';

class CustomSliderButton extends StatelessWidget {
  const CustomSliderButton({
    super.key,
    required this.child,
    required this.onSlide,
    this.sliderColor,
    this.bgColor,
    this.sliderWidth,
    this.width,
    this.outerRad,
    this.innerRad,
  });

  final Function() onSlide;
  final Widget child;
  final Color? sliderColor, bgColor;
  final double? width, sliderWidth, outerRad, innerRad;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      radius: outerRad ?? 15,
      bgColor: bgColor ?? AppColors.lightPrimary,
      child: HorizontalSlidableButton(
        height: 54,
        isRestart: true,
        initialPosition: SlidableButtonPosition.start,
        buttonWidth: sliderWidth ?? 140.0,
        color: Colors.transparent,
        width: width ?? MediaQuery.of(context).size.width * 0.88,
        onChanged: (SlidableButtonPosition position) {
          if (position == SlidableButtonPosition.end) {
            onSlide();
          }
        },
        label: ClipRRect(
          borderRadius: BorderRadius.circular(innerRad ?? 15),
          child: Container(
            width: sliderWidth ?? 140,
            color: sliderColor ?? AppColors.darkPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: child,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: (sliderWidth ?? 140.0) + 20),
            Lottie.asset(
                LottieAnime.slidingArrowWhite,
                height: 40
            ),
          ],
        ),
      ),
    );
  }
}

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final double? radius;

  const GlassMorphism({
    super.key,
    required this.child,
    this.bgColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? AppColors.lightPrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: child,
        ),
      ),
    );
  }
}