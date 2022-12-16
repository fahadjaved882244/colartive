import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabcontroller;

  final RxInt _selectedIndex = 1.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex(value);

  @override
  void onInit() {
    super.onInit();
    tabcontroller = TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  void onClose() {
    tabcontroller.dispose();
    super.onClose();
  }
}
