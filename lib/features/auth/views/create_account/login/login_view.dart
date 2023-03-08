import 'package:colartive2/extensions/async_value.dart';

import '../../../../../core_packages.dart';
import '../../../../../utils/components/scaffolds/base_scaffold.dart';
import 'components/app_login_card.dart';
import 'components/external_login_card.dart';
import 'login_controller.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    ref.listen<AsyncValue<void>>(
      loginControllerProvider,
      (_, next) {
        next.showErrorOrNavigate(context, routeName: RouteNames.settings);
      },
    );
    return BaseScaffold(
      title: AppStrings.loginTitle,
      isLoading: state.isLoading,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
          child: ListView(
            children: [
              ExternalLoginCard(
                controller: ref.read(loginControllerProvider.notifier),
              ),
              AppLoginCard(
                controller: ref.read(loginControllerProvider.notifier),
              ),
              const SizedBox(height: Paddings.lg),
              TextButton(
                onPressed: () => context.goNamed(RouteNames.home),
                child: const Text("Not now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
