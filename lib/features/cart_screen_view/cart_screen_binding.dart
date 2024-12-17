import 'package:get/get.dart';
import 'package:u_matter/features/cart_screen_view/cart_screen_view_model.dart';
import '../../utils/routes/navigator.dart';

class CartScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(
      CartScreenViewModel(
        iNavigator: Get.find<INavigator>(),
      ),
    );
  }
}