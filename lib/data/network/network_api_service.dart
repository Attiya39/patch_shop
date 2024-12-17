import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:u_matter/data/exceptions.dart';
import 'package:u_matter/data/network/base_api_service.dart';
import 'package:u_matter/data/shared_preferences/user_shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../features/home_screen_view/home_view_model.dart';
import '../../features/main_screen_view/main_screen_view_model.dart';

// Now don't have to create http get & post service for every API

class NetworkApiService extends BaseApiService {
  final UserSharedPreferences userSharedPreferences = UserSharedPreferences();

  /// .................................................. For GET requests
  @override
  Future getGetApiResponse(
    String url, {
    Map<String, dynamic>? headers,
  }) async {
    dynamic responseJson;
    try {
      // Attempt to fetch the data from the network
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          ...headers ?? {},
        },
      ).timeout(const Duration(
        // minutes: 5  /// TODO: remove this statement and uncomment the below statement
          seconds: 30
      ));
      debugPrint("StatusCode ${response.statusCode}");
      if(response.statusCode == 401){
        await logoutUserOnTokenExpiry();
        throw UnauthorisedException(
            responseJson["message"] ?? "session_expired_error".tr);
      }
      responseJson = await returnResponse(response);
      debugPrint("ResponseJson : $responseJson");
      // If the request is successful, cache the response
      final file = await DefaultCacheManager().putFile(
        url,
        response.bodyBytes,
        fileExtension: "json",
        eTag: response.headers['ETag'],
      );

      // File has been successfully cached.
      // Perform any necessary validation here.
      debugPrint("File of url $url successfully cached at ${file.path}");
      return responseJson;
    } on SocketException {
      // If there's a network error, try to load the response from cache
      try {
        final fileInfo = await DefaultCacheManager().getFileFromCache(url);
        if (fileInfo != null) {
          final file = await fileInfo.file.readAsString();
          responseJson = jsonDecode(file);
          debugPrint("Returning Cached response: $responseJson");
          return responseJson;
        } else {
          // Handle case where there's no cached data
          throw FetchDataException('no_internet_and_cached_data'.tr);
        }
      } catch (e) {
        // Rethrow if even reading from cache fails
        rethrow;
      }
    } catch (error) {
      // Handle other errors (timeout, etc.)
      rethrow;
    }
  }

  /// .................................................. For POST requestS

  @override
  Future getPostApiResponse(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
  }) async {
    dynamic responseJson;
    try {
      debugPrint("printing response");
      debugPrint("url: $url");
      debugPrint("data: $data");
      debugPrint("encoded data: ${jsonEncode(data)}");
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              ...headers ?? {},
            },
            body: jsonEncode(data), // Convert data to JSON string
          )
          .timeout(const Duration(minutes: 5)
              // Duration(seconds: 30)
              );
      debugPrint(" response of API: ${response.body}");
      // if(url == AppUrl.logout || url == AppUrl.unsubscribeOneSignal){
      //   await userSharedPreferences.saveLogoutStatusCode(response.statusCode);
      // }
      responseJson = await returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(
          "${"no_internet_connection".tr}. ${"no_internet_error_subtitle".tr}");
    } catch (error) {
      rethrow;
    }
  }

  /// .................................................. For PUT requestS

  @override
  Future getPutApiResponse(
      String url,
      dynamic data, {
        Map<String, dynamic>? headers,
      }) async {
    dynamic responseJson;
    try {
      debugPrint("printing response");
      debugPrint("url: $url");
      debugPrint("data: $data");
      debugPrint("encoded data: ${jsonEncode(data)}");
      final response = await http
          .put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          ...headers ?? {},
        },
        body: jsonEncode(data), // Convert data to JSON string
      )
          .timeout(const Duration(minutes: 5)
        // Duration(seconds: 30)
      );
      debugPrint(" response of API: ${response.body}");
      // if(url == AppUrl.logout || url == AppUrl.unsubscribeOneSignal){
      //   await userSharedPreferences.saveLogoutStatusCode(response.statusCode);
      // }
      responseJson = await returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(
          "${"no_internet_connection".tr}. ${"no_internet_error_subtitle".tr}");
    } catch (error) {
      rethrow;
    }
  }

  /// .................................................. For DELETE requestS

  @override
  Future getDeleteApiResponse(
      String url, {
        Map<String, dynamic>? headers,
      }) async {
    dynamic responseJson;
    try {
      debugPrint("printing response");
      debugPrint("url: $url");
      final response = await http
          .delete(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          ...headers ?? {},
        },

      )
          .timeout(const Duration(minutes: 5)
        // Duration(seconds: 30)
      );
      debugPrint(" response of API: ${response.body}");
      // if(url == AppUrl.logout || url == AppUrl.unsubscribeOneSignal){
      //   await userSharedPreferences.saveLogoutStatusCode(response.statusCode);
      // }
      responseJson = await returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(
          "${"no_internet_connection".tr}. ${"no_internet_error_subtitle".tr}");
    } catch (error) {
      rethrow;
    }
  }

  Map<String, String> convertHeadersToString(Map<String, String> headers) {
    return headers.map((key, value) => MapEntry(key, value.toString()));
  }

  dynamic returnResponse(http.Response response) async {
    final responseJson = jsonDecode(response.body);
    debugPrint("StatusCode: ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson["message"] ?? "bad_request".tr);
      case 401:
      // Trigger user logout due to unauthorized access (Token Expiry)
      debugPrint("case401 called");
        await logoutUserOnTokenExpiry();
        throw UnauthorisedException(
          // UnauthorisedException will be dedicated only for status code 403 (Token Expiry)
// Because on the basis of this status code, we have placed a check in logout controller to not resume the offline data uploading
            responseJson["message"] ?? "session_expired_error".tr);
      case 403:
        // Trigger user logout due to unauthorized access (Token Expiry)
        await logoutUserOnTokenExpiry();
        throw UnauthorisedException(
            // UnauthorisedException will be dedicated only for status code 403 (Token Expiry)
// Because on the basis of this status code, we have placed a check in logout controller to not resume the offline data uploading
            responseJson["message"] ?? "session_expired_error".tr);
      case 404:
        throw NoDataFoundException(
            responseJson["message"] ?? "no_data_found".tr);
      // case 413:
      //   throw FetchDataException("Request Entity Too Large");
      case 502:
        throw FetchDataException("code_502_message".tr);
      case 500:
        throw ServerMaintenanceException("server_maintenance_error_key".tr);
      case 503:
        throw ServerMaintenanceException("server_maintenance_error_key".tr);
      default:
        throw FetchDataException(responseJson["message"] ??
            '${"server_error".tr} ${response.statusCode.toString()}');
    }
  }

  // To logout the user forcefully on token expiry

  Future logoutUserOnTokenExpiry() async {
    debugPrint("LogoutOnTokenExpiry Route: ${Get.currentRoute}");
    if (Get.currentRoute != '/login') {
      // Clear the cache
      await DefaultCacheManager().emptyCache();
      debugPrint("Cache cleared successfully on Token Expiry");
      await userSharedPreferences.removeUserToken();
      await DefaultCacheManager().emptyCache();
      debugPrint("Cache cleared successfully on Logout");
      final MainScreenViewModel mainController = Get.find<MainScreenViewModel>();
      final HomeViewModel homeController = Get.find<HomeViewModel>();
      mainController.isLoggedIn.value = false;
      mainController.navigationIndex.value = 0;
      mainController.pageController.jumpToPage(0);
      mainController.onInit();
      homeController.onInit();
    }
  }
}
