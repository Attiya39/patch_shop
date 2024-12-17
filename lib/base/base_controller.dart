import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:u_matter/utils/routes/navigator.dart';

abstract class BaseController extends GetxController {
  INavigator iNavigator;
  BaseController(this.iNavigator) {}
}
