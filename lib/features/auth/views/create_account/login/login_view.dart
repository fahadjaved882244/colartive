import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core_packages.dart';
import '../../../../../utils/components/scaffolds/base_scaffold.dart';
import 'components/app_login_card.dart';
import 'components/external_login_card.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return BaseScaffold(
      title: AppStrings.loginTitle,
      noPadding: false,
      isCancel: true,
      isLoading: isLoading.value,
      child: ListView(
        children: [
          ExternalLoginCard(
            onTap: (value) => isLoading.value = value,
          ),
          AppLoginCard(
            onTap: (value) => isLoading.value = value,
          ),
        ],
      ),
    );
  }
}
