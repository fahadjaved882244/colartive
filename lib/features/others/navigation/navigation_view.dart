import 'package:colartive2/routes/app_router/app_router.dart';

import '../../../core_packages.dart';
import 'components/navigation_bar.dart';

class NavigationView extends StatelessWidget {
  final Widget child;
  const NavigationView({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onChanged: (i) => _onItemTapped(i, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(const HomeRoute().location)) {
      return 0;
    } else if (location.startsWith(const SearchRoute().location)) {
      return 1;
    } else if (location.startsWith(const ShowCaseRoute().location)) {
      return 2;
    } else if (location.startsWith(const SettingsRoute().location)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        const HomeRoute().go(context);
        break;
      case 1:
        const SearchRoute().go(context);
        break;
      case 2:
        const ShowCaseRoute().go(context);
        break;
      case 3:
        const SettingsRoute().go(context);
        break;
    }
  }
}
