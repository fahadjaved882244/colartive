import 'package:colartive2/modules/components/controllers/i_base_controller.dart';
import 'package:get/get.dart';

class NavigationController extends IBaseController {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex(value);
}
