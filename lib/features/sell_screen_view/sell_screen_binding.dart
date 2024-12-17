import 'package:get/get.dart';
import 'package:u_matter/features/sell_screen_view/sell_screen_view_model.dart';
import '../../utils/routes/navigator.dart';

class SellScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(
      SellScreenViewModel(
        iNavigator: Get.find<INavigator>(),
      ),
    );
  }
}