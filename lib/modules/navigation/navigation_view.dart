import 'package:colartive2/modules/components/scaffolds/base_scaffold.dart';
import 'package:colartive2/modules/components/widgets/app_logo_text.dart';
import 'package:colartive2/modules/navigation/components/navigation_bar.dart';
import 'package:flutter/cupertino.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const AppLogoText(),
      bottomNavigationBar: CustomNavigationBar(onChanged: (i) {}),
      child: const Center(
        child: Text('Colartive'),
      ),
    );
  }
}
