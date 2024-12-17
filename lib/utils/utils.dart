import 'dart:io';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:u_matter/data/shared_preferences/user_shared_preferences.dart';
import 'package:u_matter/res/common_widgets/buttons/custom_primary_button.dart';
import 'package:u_matter/utils/constants/color_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Utils {
  static double? getRandomHeight() {
    final random = Random();
    const minHeight = 300;
    const maxHeight = 550;
    const heightDifference = 100;
    final randomHeight =
        random.nextInt(maxHeight - minHeight - heightDifference + 1) +
            minHeight;
    return randomHeight.toDouble();
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void changeFocusNode(BuildContext context,
      {required FocusNode current, required FocusNode next}) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        fontSize: 18,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        // borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    Get.showSnackbar(
      GetSnackBar(
        // message: message,
        messageText: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: appPrimaryColor.withOpacity(0.9),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        borderRadius: 10.r,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      ),
    );
  }

  static void snackBarWithoutContext(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      "Token Expired",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: white,
    );
  }

  static void showAlertToast(String title,
      {String? subtitle, String? icon, int? titleMaxLines}) {
    // NotificationsUtils.showHeadsUpNotification(title, body);
    snackBar(
      title.isNotEmpty ? title : 'No title',
      Get.key.currentState!.context,
    );
  }

  static void showErrorContainer(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: CustomPrimaryButton(
                  height: 45.h,
                  width: 140.w,
                  title: "Okay",
                  textStyle: TextStyle(
                    color: whiteColor,
                    fontSize: 15.sp,
                    fontStyle: FontStyle.italic,
                  ),
                  borderRadius: 25.r,
                  backgroundColor: darkBlueColor,
                  onTap: () {
                    Navigator.of(context).pop();
                    //  TextFieldValidate();
                  }),
            ),
          ],
        );
      },
    );
  }

  static Future<bool> isConnectedToInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        // Check whether Network is connected to the Internet
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
    }
    return false;
  }

  // For checking internet specifically on login screen
  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await http
            .get(Uri.parse('http://clients3.google.com/generate_204'));
        if (response.statusCode == 204) {
          return true;
        } else {
          return false;
        }
      } catch (_) {
        return false;
      }
    }
    return false;
  }

  static TextInputType getInputType(String? value) {
    switch (value) {
      case "text":
        return TextInputType.text;
      case "userName":
        return TextInputType.text;
      case "userZipCode":
        return TextInputType.number;
      case "datetime":
        return TextInputType.datetime;
      case "email":
        return TextInputType.emailAddress;
      case "multiline":
        return TextInputType.multiline;
      case "name":
        return TextInputType.name;
      case "number":
        return TextInputType.number;
      case "phone":
        return TextInputType.phone;
      case "otp":
        return TextInputType.phone;
      case "url":
        return TextInputType.url;
      case "none":
        return TextInputType.none;
      default:
        return TextInputType.text;
    }
  }

  static Future<bool> isLanguageAlreadySelected() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localeString = prefs.getString('locale');
    return localeString != null && localeString.isNotEmpty;
  }

  // This function will fetch the 'en' or 'es' key only from the sharedPreferences and then it will be passed to the api in params in the repository of each Api
  static Future<String> get fetchLanguageCodeParam async {
    UserSharedPreferences userSharedPreferences = UserSharedPreferences();
    final Locale? locale = await userSharedPreferences.getLocalePreference();
    if (locale != null) {
      return locale.languageCode;
    } else {
      // Default to English if no locale saved
      return "en";
    }
  }

  static String getPreviousRoute() {
    String previousRoute = Get.previousRoute;
    return previousRoute;
  }

  static Future<bool> checkLoginStatus() async {
    UserSharedPreferences userSharedPreferences = UserSharedPreferences();
    final token = await userSharedPreferences.getUserToken();
    debugPrint("TOKEN $token");
    return token != "";
  }

}
