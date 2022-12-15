import 'package:get/get.dart';

import '../../auth/auth_controller.dart';

abstract class IBaseController<P> extends GetxController {
  final provider = Get.find<P>();

  final auth = Get.find<AuthController>();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading(value);
}
