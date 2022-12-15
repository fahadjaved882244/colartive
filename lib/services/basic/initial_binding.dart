import 'package:get/instance_manager.dart';
import 'theme_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
