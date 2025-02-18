import 'package:colartive2/routes/app_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/navigation_bar.dart';

class NavigationView extends StatelessWidget {
  final Widget child;
  const NavigationView({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      // bottomNavigationBar: CustomNavigationBar(
      //   selectedIndex: _calculateSelectedIndex(context),
      //   onChanged: (i) => _onItemTapped(i, context),
      // ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppPaths.home)) {
      return 0;
    } else if (location.startsWith(AppPaths.showcase)) {
      return 1;
    } else if (location.startsWith(AppPaths.search)) {
      return 2;
    } else if (location.startsWith(AppPaths.settings)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppPaths.home);
        break;
      case 1:
        context.go(AppPaths.showcase);
        break;
      case 2:
        context.go(AppPaths.search);
        break;
      case 3:
        context.go(AppPaths.settings);
        break;
    }
  }
}
