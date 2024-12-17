import 'dart:async';

import 'package:get/get.dart';

abstract class INavigator {
  Future<T?>? pushNamed<T>(String route,
      {dynamic arguments,
      int? id,
      bool preventDuplicates = true,
      Map<String, String>? parameters});

  void pop<T>({T? result});

  void popUntil(String route, {String analyticKey});

  void pushReplacementNamed(String route,
      {dynamic arguments, Map<String, String>? parameters});

  void offAndPushNamed(String route,
      {dynamic arguments, int? id, Map<String, String>? parameters});

  void offAndPushNamedUntil(String route,
      {dynamic arguments, int? id, Map<String, String>? parameters});
}

class NavigatorImpl extends INavigator {
  @override
  void pop<T>({T? result}) {
    Get.back<T>(result: result);
  }

  @override
  void popUntil(String route, {String analyticKey = ''}) {
    Get.until((data) => data.settings.name == route);
  }

  @override
  Future<T?>? pushNamed<T>(String route,
      {dynamic arguments,
      int? id,
      bool preventDuplicates = true,
      Map<String, String>? parameters}) async {
    return await Get.toNamed<T>(route,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters);
  }

  @override
  void offAndPushNamed(String route,
      {dynamic arguments, int? id, Map<String, String>? parameters}) {
    Get.offNamed(route, arguments: arguments, id: id, parameters: parameters);
  }

  @override
  void pushReplacementNamed(String route,
      {dynamic arguments, Map<String, String>? parameters}) {
    Get.offAllNamed(route, arguments: arguments);
  }


  @override
  void offAndPushNamedUntil(String route, {arguments, int? id, Map<String, String>? parameters}) {
    Get.offNamedUntil(route, (route) => false, arguments: arguments, id: id, parameters: parameters);
  }

}
