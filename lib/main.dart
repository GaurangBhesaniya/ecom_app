import 'dart:convert';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/presentation/view/introductory/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/app_theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCyfK3-nEVq51LbrvtlBkMhMtWyd4F7O9Y',
          appId: '1:478080336172:android:1045863f221145198c2c89',
          messagingSenderId: '478080336172',
          projectId: 'ecom-app-5ef5c'));

  pref = await SharedPreferences.getInstance();

  isLogin=pref!.getBool('isLogin') ?? false;
  userName=pref!.getString('UserName') ?? 'Guest User';
  userEmail=pref!.getString('UserEmail') ?? 'abc@gmail.com';
  userProfile=pref!.getString('UserProfile') ?? '';
  orderDetails = jsonDecode(pref!.getString("orderDetails") ?? "[]") ?? [];


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: themeData(context),
      theme: themeData(context),
      home: const SplashScreen(),
    );
  }
}
