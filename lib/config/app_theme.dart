import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData themeData(BuildContext context) => ThemeData(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: AppColors.appBackGroundColor,
    // fontFamily: "Gilroy-Medium",
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightModeBackgroundColor,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(
        fontSize: 14,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
    ),
    brightness: MediaQuery.of(context).platformBrightness,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.black,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      scaffoldBackgroundColor: Color(0xff6397FF),
      primaryColor: Color(0xff6397FF),
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(color: Colors.white), // Set text color to white
      ),
    ));
