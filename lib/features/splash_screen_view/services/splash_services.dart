import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/routes/app_pages.dart';
import '../../../data/shared_preferences/user_shared_preferences.dart';

class SplashServices {
  // Concise way to define a getter method named "getUserData()" by calling the
  // "getUser()" method from an instance of the "UserViewModel" class
  Future<String> getUserData() async =>
      await UserSharedPreferences().getUserToken();

  checkLoginStatus() async {
    UserSharedPreferences _userSharedPreferences = UserSharedPreferences();
    final token = await _userSharedPreferences.getUserToken();
    debugPrint("TOKEN $token");
    return token != "";
  }

  Future<void> redirectToHomeScreenVIEW() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.mainScreenView, arguments: {'isServiceLogged': false});
  }
}
