import 'package:ecom_app/config/app_anime.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../bottom_navigation/app_bottom_navigation.dart';
import 'on_boarding.dart';

class LoginWaitingScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPhnNumber;
  final String userProfile;
  final String? token;

  const LoginWaitingScreen(
      {super.key,
      required this.userName,
      required this.userEmail,
      required this.userPhnNumber,
      required this.userProfile,this.token});

  @override
  State<LoginWaitingScreen> createState() => _LoginWaitingScreenState();
}

class _LoginWaitingScreenState extends State<LoginWaitingScreen> {


  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  String getFirstThreeWords(String input) {
    List<String> words = input.split(" ");
    if (words.length >= 3) {
      return words.sublist(0, 3).join(" ");
    } else {
      return input;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      pref!.setBool('isLogin',true);
      pref!.setString('UserName', widget.userName);
      pref!.setString('UserEmail', widget.userEmail);
      pref!.setString('UserProfile', widget.userProfile);

      isLogin=pref!.getBool('isLogin')!;
      userName=pref!.getString('UserName')!;
      userEmail=pref!.getString('UserEmail')!;
      userProfile=pref!.getString('UserProfile')!;

      Future.delayed(const Duration(seconds:5),(){
        Get.off(() => const AppBottomNavigation());
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> nameParts =
        widget.userName.split(" "); // Split the full name by space
    String firstName = nameParts[0];
    String capitalizedString = capitalizeFirstLetter(firstName);

    return Scaffold(
        body: (Get.height <= 670.0)?Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top:160),
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImage.smallWaitingScreenBack),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  repeat: ImageRepeat.repeat)),
          child: const Column(
            children: [
              Text(
                "Please Wait!",
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We are fetching your orders..",
                style: TextStyle(
                    color: Color(0xff6C82AD),
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                margin: const EdgeInsets.only(bottom:14),
                height: 150,
                width: 150,
                child: const RiveAnimation.asset(
                  RiveAnime.outForDeliveryThree,
                ))),
        Positioned(
          bottom:237,
          right:15,
          child: Container(
            alignment: Alignment.center,
            height: 22,
            width: 95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    width: 1,
                    color: const Color(0xff3873E8),
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignOutside)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  radius: 1.5,
                  backgroundColor: Color(0xff3873E8),
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    // this will help add dots after maxLines
                    maxLines: 1,
                    // max lines after that dots comes
                    strutStyle: const StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                        style: const TextStyle(
                            color: Color(0xff3873E8),
                            fontWeight: FontWeight.w600),
                        text: capitalizedString),
                  ),
                ),
                const CircleAvatar(
                  radius: 1.5,
                  backgroundColor: Color(0xff3873E8),
                ),
              ],
            ),
          ),
        ),
      ],
    ):Stack(children: [
            Container(
              padding: const EdgeInsets.only(top: 250),
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImage.waitingScreenBack),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      repeat: ImageRepeat.repeat)),
              child: const Column(
                children: [
                  Text(
                    "Please Wait!",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We are fetching your orders..",
                    style: TextStyle(
                        color: Color(0xff6C82AD),
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 21),
                    height: 150,
                    width: 150,
                    child: const RiveAnimation.asset(
                      RiveAnime.outForDeliveryThree,
                    ))),
            Positioned(
              bottom:310,
              right:20,
              child: Container(
                alignment: Alignment.center,
                height: 22,
                width: 95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        width: 1,
                        color: const Color(0xff3873E8),
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignOutside)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      radius: 1.5,
                      backgroundColor: Color(0xff3873E8),
                    ),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        // this will help add dots after maxLines
                        maxLines: 1,
                        // max lines after that dots comes
                        strutStyle: const StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                            style: const TextStyle(
                                color: Color(0xff3873E8),
                                fontWeight: FontWeight.w600),
                            text: capitalizedString),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 1.5,
                      backgroundColor: Color(0xff3873E8),
                    ),
                  ],
                ),
              ),
            ),
          ])
    );
  }
}
