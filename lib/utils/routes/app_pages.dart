import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_matter/features/cart_screen_view/cart_screen_binding.dart';
import 'package:u_matter/features/cart_screen_view/cart_screen_view.dart';
import 'package:u_matter/features/home_screen_view/home_screen_binding.dart';
import 'package:u_matter/features/home_screen_view/home_screen_view.dart';
import 'package:u_matter/features/inbox_screen_view/inbox_screen_binding.dart';
import 'package:u_matter/features/inbox_screen_view/inbox_screen_view.dart';
import 'package:u_matter/features/main_screen_view/main_screen_binding.dart';
import 'package:u_matter/features/main_screen_view/main_screen_view.dart';
import 'package:u_matter/features/sell_screen_view/sell_screen_binding.dart';
import 'package:u_matter/features/sell_screen_view/sell_screen_view.dart';
import 'package:u_matter/features/splash_screen_view/splash.dart';

part 'app_routes.dart';

GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreenView;

  static final routes = [
    ///Basic screen is for testing purpose only. Later on it will be removed.
    _buildPage(
      name: _Paths.mainScreen,
      page: MainScreenView(),
      binding: MainScreenBinding(),
      // binding: HomeScreenBinding(),
      transition: Transition.rightToLeftWithFade,
    ),


    _buildPage(
      name: _Paths.home,
      page: HomeView(),
      binding: HomeScreenBinding(),
      // binding: HomeScreenBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

    _buildPage(
      // Need to give binding to splash screen as well
      name: _Paths.splash,
      page: const SplashView(),
      transition: Transition.rightToLeftWithFade,
    ),

    _buildPage(
      name: _Paths.cartScreen,
      page: CartScreenView(),
      binding: CartScreenBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

    _buildPage(
      name: _Paths.sellScreen,
      page: SellScreenView(),
      binding: SellScreenBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

    _buildPage(
      name: _Paths.inboxScreen,
      page: InboxScreenView(),
      binding: InboxScreenBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

  ];

  static GetPage _buildPage({
    required String name,
    required Widget page,
    Bindings? binding,
    List<Bindings>? bindings,
    Transition transition = Transition.rightToLeft,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return GetPage(
      name: name,
      page: () => page,
      binding: binding,
      bindings: bindings ?? [],
      transitionDuration: transitionDuration,
      transition: transition,
    );
  }
}
