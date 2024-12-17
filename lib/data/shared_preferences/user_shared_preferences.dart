import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// In this view model we are storing the token in shared preferences
/// So that it can be used across the app

class UserSharedPreferences {
  final String apiKey = "token";
  final String userRole = "role";
  static const String localeKey = 'locale_preference';
  final String _tokenTimestampKey = 'token_timestamp';

  Future saveUserToken(String token) async {
    final now = DateTime.now();
    final utcTime = now.toUtc();
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(apiKey, token);
    sp.setInt(_tokenTimestampKey, utcTime.millisecondsSinceEpoch);
  }

  Future<String> getUserToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString(apiKey);

    return token ?? "";
  }

  Future removeUserToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(apiKey);
    sp.remove(_tokenTimestampKey);
    debugPrint("tokenAfterRemoval ${sp.getString(apiKey)}");
    // Get.offAllNamed(Routes.loginScreenView, arguments: {'fromNotification': false});
  }

  Future<void> saveLocalePreference(String locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'locale', locale); // Ensure the key matches what you use in fetchLocale
  }

  Future<Locale?> getLocalePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localeString = prefs.getString('locale');
    if (localeString != null) {
      final parts = localeString.split(",");
      return Locale(parts[0].trim(), parts.length > 1 ? parts[1].trim() : '');
    }
    return null;
  }

}
