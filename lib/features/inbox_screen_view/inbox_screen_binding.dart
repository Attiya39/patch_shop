import 'package:get/get.dart';
import 'package:u_matter/features/inbox_screen_view/inbox_screen_view_model.dart';
import '../../utils/routes/navigator.dart';

class InboxScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(
      InboxScreenViewModel(
        iNavigator: Get.find<INavigator>(),
      ),
    );
  }
}