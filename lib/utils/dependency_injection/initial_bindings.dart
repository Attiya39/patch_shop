import 'package:get/get.dart';
import 'package:u_matter/data/shared_preferences/user_shared_preferences.dart';
import 'package:u_matter/utils/routes/navigator.dart';

class InitialBindings {
  Future<void> onInit() async {
    await _initDependencies();
    _initializeInterceptors();
  }

  Future<void> _initDependencies() async {
    Get.put<INavigator>(NavigatorImpl(), permanent: true);
    /// Register UserSharedPreferences globally.
    /// Because when user navigate back to home screen the controller is destroyed and it does not find UserSharedPreferences() class
    Get.put(UserSharedPreferences());

  }

  void _initializeInterceptors() {
  }
}
