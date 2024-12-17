import 'package:get/get.dart';
import 'package:u_matter/data/shared_preferences/user_shared_preferences.dart';
import 'package:u_matter/features/main_screen_view/main_screen_view_model.dart';
import 'package:u_matter/utils/routes/navigator.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<UserSharedPreferences>(
          () => UserSharedPreferences(),
    );

    Get.lazyPut<MainScreenViewModel>(() => MainScreenViewModel(
      iNavigator: Get.find<INavigator>(),
      userSharedPreferences: Get.find<UserSharedPreferences>(),
    ));
  }
}
