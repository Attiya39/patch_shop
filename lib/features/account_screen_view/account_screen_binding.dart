import 'package:get/get.dart';
import 'package:u_matter/features/account_screen_view/account_screen_view_model.dart';
import '../../utils/routes/navigator.dart';

class AccountScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(
      AccountScreenViewModel(
        iNavigator: Get.find<INavigator>(),
      ),
    );
  }
}
