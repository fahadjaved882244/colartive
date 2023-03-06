import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../../../core_packages.dart';
import 'components/navigation_bar.dart';
import 'components/navigation_rail.dart';

class NavigationView extends StatelessWidget {
  final Widget child;
  const NavigationView({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        body: SlotLayout(
          config: {
            Breakpoints.small: SlotLayout.from(
              key: const Key('small-body'),
              builder: (_) => child,
            ),
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('medium-body'),
              builder: (_) => Padding(
                padding: const EdgeInsets.all(Paddings.sm),
                child: child,
              ),
            ),
          },
        ),

        // extended body on the right side in desktop mode
        // secondaryBody: SlotLayout(
        //   config: {
        //     Breakpoints.mediumAndUp: SlotLayout.from(
        //       outAnimation: AdaptiveScaffold.stayOnScreen,
        //       key: const Key('Secondary Body'),
        //       builder: (_) => SafeArea(
        //         child: _DetailTile(item: _allItems[selected ?? 0]),
        //       ),
        //     ),
        //   },
        // ),

        // Side Navbar - navigation rail in desktop mode
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.medium: SlotLayout.from(
              key: const Key('primaryNavigation'),
              builder: (_) => CustomNavigationRail(
                selectedIndex: _calculateSelectedIndex(context),
                onChanged: (i) => _onItemTapped(i, context),
              ),
            ),
            Breakpoints.large: SlotLayout.from(
              key: const Key('ExtendedPrimaryNavigation'),
              builder: (_) => CustomNavigationRail(
                extended: true,
                selectedIndex: _calculateSelectedIndex(context),
                onChanged: (i) => _onItemTapped(i, context),
              ),
            ),
          },
        ),

        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig?>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('bottomNavigation'),
              outAnimation: AdaptiveScaffold.topToBottom,
              builder: (_) => CustomNavigationBar(
                selectedIndex: _calculateSelectedIndex(context),
                onChanged: (i) => _onItemTapped(i, context),
              ),
            ),
          },
        ),
      ),
      // bottomNavigationBar: CustomNavigationBar(
      //   selectedIndex: _calculateSelectedIndex(context),
      //   onChanged: (i) => _onItemTapped(i, context),
      // ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(AppPaths.home)) {
      return 0;
    } else if (location.startsWith(AppPaths.search)) {
      return 1;
    } else if (location.startsWith(AppPaths.showcase)) {
      return 2;
    } else if (location.startsWith(AppPaths.settings)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(RouteNames.home);
        break;
      case 1:
        context.goNamed(RouteNames.search);
        break;
      case 2:
        context.goNamed(RouteNames.showcase);
        break;
      case 3:
        context.goNamed(RouteNames.settings);
        break;
    }
  }
}
