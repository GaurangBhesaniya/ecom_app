import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';

class SignupWithGoogle extends StatelessWidget {
  final void Function() onTap;

  const SignupWithGoogle({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: IgnorePointer(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.transparent,
              border: Border.all(
                  width: 1.5,
                  color: AppColors.primary,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignOutside)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(AppImage.googleIcon),
                  height: 18,
                  width: 18,
                  alignment: Alignment.center,
                  color: null,
                  fit: BoxFit.scaleDown),
              SizedBox(
                width: 2,
              ),
              Text(
                "Continue with Gmail",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
