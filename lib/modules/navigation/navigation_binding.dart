import 'package:get/get.dart';

import 'navigation_controller.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}
