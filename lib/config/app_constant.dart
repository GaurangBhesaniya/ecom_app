import 'package:ecom_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? pref;
int selectedIndex = 0;
bool isLogin=false;
bool isForNote = true;
String userName='Guest User';
String userEmail='abc@gmail.com';
String userProfile='';

List<dynamic> orderDetails = [];

ValueNotifier<bool> isReplace = ValueNotifier<bool>(true);

