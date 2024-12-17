import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_matter/base/base_controller.dart';
import 'package:u_matter/data/shared_preferences/user_shared_preferences.dart';
import 'package:u_matter/features/account_screen_view/account_screen_binding.dart';
import 'package:u_matter/features/cart_screen_view/cart_screen_binding.dart';
import 'package:u_matter/features/inbox_screen_view/inbox_screen_binding.dart';
import 'package:u_matter/features/sell_screen_view/sell_screen_binding.dart';
import 'package:u_matter/utils/utils.dart';

import '../../utils/routes/navigator.dart';
import '../home_screen_view/home_screen_binding.dart';

class MainScreenViewModel extends BaseController {
  UserSharedPreferences userSharedPreferences;
  RxString role = ''.obs;

  MainScreenViewModel({
    required INavigator iNavigator,
    required this.userSharedPreferences,
  })  : super(iNavigator);

  var selectedIndex = 0.obs;
  final previousIndex = 0.obs;
  var pageController = PageController();

  var navigationIndex = 0.obs;
  RxBool isLoggedIn = false.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    navigationIndex.value = index;
  }

  var showSignupScreen = false.obs;
  Map<String, dynamic>? routeArguments = Get.arguments;

  @override
  void onInit() async {

    super.onInit();

    debugPrint("navIndex: ${navigationIndex.value}");
    pageController =
        PageController(initialPage: navigationIndex.value,
        );

    HomeScreenBinding().dependencies();
    CartScreenBinding().dependencies();
    SellScreenBinding().dependencies();
    InboxScreenBinding().dependencies();
    AccountScreenBinding().dependencies();

    final isNetworkConnected = await Utils.isConnectedToInternet();
    debugPrint("isNetworkConnected onInit() $isNetworkConnected");
    debugPrint("Home Previous Route ${Get.previousRoute}");


  }
}
