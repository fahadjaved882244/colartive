import 'package:colartive2/modules/navigation/components/navigation_bar.dart';
import 'package:colartive2/modules/navigation/drawer/drawer_view.dart';
import 'package:colartive2/modules/navigation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(onChanged: (i) {
        controller.selectedIndex = i;
        controller.tabcontroller.animateTo(i);
      }),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.tabcontroller,
        children: const [
          DrawerView(),
          SizedBox(),
          SizedBox(),
        ],
      ),
    );
  }
}
