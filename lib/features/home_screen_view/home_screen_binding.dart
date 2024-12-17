import 'package:get/get.dart';
import 'package:u_matter/data/shared_preferences/user_shared_preferences.dart';
import 'package:u_matter/features/home_screen_view/home_view_model.dart';
import 'package:u_matter/utils/routes/navigator.dart';

import '../../repo/home_repo.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepo>(
      () => HomeRepo(),
    );

    Get.lazyPut<UserSharedPreferences>(
      () => UserSharedPreferences(),
    );

    Get.lazyPut<HomeViewModel>(() => HomeViewModel(
          iNavigator: Get.find<INavigator>(),
          homeRepo: Get.find<HomeRepo>(),
          userSharedPreferences: Get.find<UserSharedPreferences>(),
          // notificationsCountService: Get.find<NotificationsCountService>(),
        ));
  }
}
