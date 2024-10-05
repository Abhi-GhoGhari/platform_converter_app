import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PlatformConvert extends GetxController {
  RxBool isAndroid = false.obs;

  void togglePlatform() => isAndroid(!isAndroid.value);
}
