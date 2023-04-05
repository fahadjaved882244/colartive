import 'package:colartive2/extensions/base_state_x.dart';
import 'package:colartive2/features/auth/views/create_account/login/login_controller.dart';
import 'package:colartive2/utils/state/base_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core_packages.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import 'components/app_login_card.dart';
import 'components/external_login_card.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final autovalidateMode = useState(AutovalidateMode.disabled);

    ref.listen<BaseState>(
      loginControllerProvider,
      (_, next) {
        next.showErrorOrNav(context, RouteNames.settings);
      },
    );
    return FormScaffold(
      title: AppStrings.loginTitle,
      isLoading: state.isLoading,
      formKey: formKey,
      autovalidateMode: autovalidateMode.value,
      children: [
        ExternalLoginCard(
          controller: ref.read(loginControllerProvider.notifier),
        ),
        AppLoginCard(
          formKey: formKey,
          autovalidateMode: autovalidateMode,
          controller: ref.read(loginControllerProvider.notifier),
        ),
        const SizedBox(height: Paddings.sm),
        const Divider(),
        const SizedBox(height: Paddings.sm),
        TextButton(
          onPressed: () => context.goNamed(RouteNames.home),
          child: const Text("Not now"),
        ),
      ],
    );
  }
}
