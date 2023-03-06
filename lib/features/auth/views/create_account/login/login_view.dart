import '../../../../../core_packages.dart';
import '../../../../../utils/components/scaffolds/base_scaffold.dart';
import '../../../data/utils/auth_error_handler.dart';
import 'components/app_login_card.dart';
import 'components/external_login_card.dart';
import 'login_controller.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    ref.listen<AsyncValue>(
      loginControllerProvider,
      (prev, next) {
        if (!next.isRefreshing && next.hasError) {
          AuthErrorHandler.handleError(context, next.error!);
        } else if (!next.isRefreshing && next.hasValue) {
          context.goNamed(RouteNames.settings);
        }
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
              const SizedBox(height: Paddings.sm),
              const Divider(),
              const SizedBox(height: Paddings.sm),
              TextButton(
                onPressed: () => context.goNamed(RouteNames.settings),
                child: const Text("I'll do this later"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
